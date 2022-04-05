import { Request, Response } from "express";
import { getLang } from "../constants/Lang";
import { db } from "../db";
import { log } from "../db/logger";
import { sendMail } from "../mail";
import { resetPassword } from "../mail/templates/resetPassword";
import { generateRandomString } from "../utils/helpers";
import { password } from "../utils/password";
import { Res, returnCode } from "../utils/returnCodes";
import {
  User,
  user as userUtils,
  UserChangeEmail,
  UserChangeFav,
  UserChangeFullname,
  UserCheckOTPAndReset,
  UserLogin,
  UserRegister,
  UserResetPassword,
} from "../utils/user";

const user = (app: any) => {
  /**
   * Route permettant de récupérer un JSON avec tous les bancs depuis la base de donnée
   * !! Nécessite l'authentification avec le header `x-auth` !!
   */
  app.get("/user/info", async function (req: Request, res: Response) {
    if (req.get("x-auth") === undefined) {
      res
        .status(returnCode.unauthorized.code)
        .json(returnCode.unauthorized.payload);
    } else {
      try {
        if (!(await userUtils.exists(parseInt(req.get("x-auth") ?? "")))) {
          res
            .status(returnCode.unknownUser.code)
            .json(returnCode.unknownUser.payload);
        } else {
          const row = await db.queryParams(
            "SELECT * FROM `users` WHERE `id` = ?",
            [req.get("x-auth")]
          );

          const user: User = row[0];
          const userJson = {
            id: user.id,
            prenom: user.prenom,
            nom: user.nom,
            mail: user.mail,
            pseudo: user.pseudo,
            favoris: user.favoris,
            is_ads: user.is_ads,
            is_banned: user.is_banned,
            is_deleted: user.is_deleted,
            reset_key: user.reset_key,
          };
          res.status(200).json(userJson);
        }
      } catch (error: any) {
        log(
          `Erreur interne GET/user/info => ${error.message}`,
          req.get("x-auth")
        );
        res
          .status(returnCode.internalError.code)
          .json(returnCode.internalError.payload);
      }
    }
  });

  /**
   * Route permettant d'enregistrer un nouvel utilisateur en base de donnée'
   */
  app.post("/user/register", async function (req: Request, res: Response) {
    const body: UserRegister = req.body;
    if (
      !body.hasOwnProperty("prenom") ||
      !body.hasOwnProperty("nom") ||
      !body.hasOwnProperty("email") ||
      !body.hasOwnProperty("password") ||
      !body.hasOwnProperty("username")
    ) {
      log(
        `Erreur POST/user/register => ${returnCode.missingParameters.payload.message}`,
        req.get("x-auth")
      );
      res
        .status(returnCode.missingParameters.code)
        .json(returnCode.missingParameters.payload);
    } else {
      const userRegisterExists = await userUtils.existsRegister(
        body.email,
        body.username
      );
      if (
        userRegisterExists.email ||
        userRegisterExists.username ||
        body.email === "Geobench"
      ) {
        if (userRegisterExists.email && userRegisterExists.username) {
          res
            .status(returnCode.alreadyUser.both.code)
            .json(returnCode.alreadyUser.both.payload);
        } else if (userRegisterExists.email) {
          res
            .status(returnCode.alreadyUser.mail.code)
            .json(returnCode.alreadyUser.mail.payload);
        } else {
          res
            .status(returnCode.alreadyUser.username.code)
            .json(returnCode.alreadyUser.username.payload);
        }
      } else {
        const hashed = await password.hash(body.password);
        const user: User = {
          prenom: body.prenom,
          nom: body.nom,
          pseudo: body.username,
          mail: body.email,
          mdp: hashed,
          favoris: "[]",
          reset_key: generateRandomString(16),
        };
        try {
          const query = await db.queryParams(
            "INSERT INTO `users`(`prenom`, `nom`, `mail`, `pseudo`, `mdp`, `favoris`, `reset_key`, `platform`) VALUES (?, ?, ?, ?, ?, ?, ?, null)",
            [
              user.prenom,
              user.nom,
              user.mail,
              user.pseudo,
              user.mdp,
              user.favoris,
              user.reset_key,
            ]
          );

          log(query, req.get("x-auth"));
          res
            .status(returnCode.userCreated.code)
            .json(returnCode.userCreated.payload);
        } catch (error: any) {
          log(
            `Erreur interne POST/user/register => ${error.message}`,
            req.get("x-auth")
          );
          res
            .status(returnCode.internalError.code)
            .json(returnCode.internalError.payload);
        }
      }
    }
  });

  /**
   * Route permettant de supprimer un utilisateur
   * !! Nécessite l'authentification avec le header `x-auth` !!
   */
  app.post("/user/delete", async function (req: Request, res: Response) {
    if (req.get("x-auth") === undefined) {
      res
        .status(returnCode.unauthorized.code)
        .json(returnCode.unauthorized.payload);
    } else {
      try {
        if (!(await userUtils.exists(parseInt(req.get("x-auth") ?? "")))) {
          res
            .status(returnCode.unknownUser.code)
            .json(returnCode.unknownUser.payload);
        } else {
          const row = await db.queryParams(
            "UPDATE `users` SET`is_deleted`=1 WHERE `id` = ?",
            [req.get("x-auth")]
          );
          const row2 = await db.queryParams(
            "SELECT `pseudo` FROM `users` WHERE `id` = ?",
            [req.get("x-auth")]
          );
          const row3 = await db.queryParams(
            "UPDATE `bancs` SET `user`= 'Geobench' WHERE `user` = ?",
            [row2[0].pseudo]
          );

          res.status(200).json({ row, row2, row3 });
        }
      } catch (error: any) {
        log(
          `Erreur interne POST/user/delete => ${error.message}`,
          req.get("x-auth")
        );
        res
          .status(returnCode.internalError.code)
          .json(returnCode.internalError.payload);
      }
    }
  });

  /**
   * Route permettant de connecter un utilisateur
   */
  app.post("/user/login", async function (req: Request, res: Response) {
    const body: UserLogin = req.body;
    if (!body.hasOwnProperty("login") || !body.hasOwnProperty("password")) {
      log(
        `Erreur POST/user/login => ${returnCode.missingParameters.payload.message}`,
        req.get("x-auth")
      );
      res
        .status(returnCode.missingParameters.code)
        .json(returnCode.missingParameters.payload);
    } else if (
      body.platform !== "ios" &&
      body.platform !== "android" &&
      body.platform !== undefined
    ) {
      res
        .status(returnCode.platformNotSupported.code)
        .json(returnCode.platformNotSupported.payload);
    } else {
      const isUser = await userUtils.existsRegister(body.login, body.login);
      if (isUser.email || isUser.username) {
        const user = await userUtils.info(body.login);
        const passwordMatch = await password.verify(body.password, user.mdp!);
        if (passwordMatch) {
          await db.queryParams(
            "UPDATE `users` SET `platform` = ? WHERE `id` = ?",
            [body.platform ?? null, user.id]
          );
          const userInfo = await userUtils.info(body.login);

          delete userInfo.mdp;
          res.status(200).json(userInfo);
        } else {
          res
            .status(returnCode.user.wrongPassword.code)
            .json(returnCode.user.wrongPassword.payload);
        }
      } else {
        res
          .status(returnCode.unknownUser.code)
          .json(returnCode.unknownUser.payload);
      }
    }
  });

  /**
   * Route permettant de demander la réinitialisation du mot de passe
   */
  app.post("/user/reset", async function (req: Request, res: Response) {
    const body: UserResetPassword = req.body;
    if (!body.hasOwnProperty("lang") || !body.hasOwnProperty("email")) {
      log(
        `Erreur POST/user/reset => ${returnCode.missingParameters.payload.message}`,
        req.get("x-auth")
      );
      res
        .status(returnCode.missingParameters.code)
        .json(returnCode.missingParameters.payload);
    } else {
      try {
        const userExist = await userUtils.existsRegister(body.email, "");
        if (!userExist.email) {
          res
            .status(returnCode.unknownUser.code)
            .json(returnCode.unknownUser.payload);
        } else {
          const resetCode = userUtils.resetCode();
          await db.queryParams("DELETE FROM `reset_password` WHERE user = ?", [
            body.email,
          ]);
          const reqResetCode = await db.queryParams(
            "INSERT INTO `reset_password`(`user`, `code`) VALUES (?,?)",
            [body.email, resetCode]
          );

          const emailTpl = resetPassword(body.lang, resetCode.toString());
          const email = await sendMail(
            body.email,
            getLang(body.lang).passwordReset.password_title,
            emailTpl
          );

          res.status(200).json({ email: email, database: reqResetCode });
        }
      } catch (error: any) {
        log(
          `Erreur interne GET/user/info => ${error.message}`,
          req.get("x-auth")
        );
        res
          .status(returnCode.internalError.code)
          .json(returnCode.internalError.payload);
      }
    }
  });

  /**
   * Route permettant de demander de check le code OTP et de modifier le mot de passe
   */
  app.put("/user/updatePassword", async function (req: Request, res: Response) {
    const body: UserCheckOTPAndReset = req.body;
    if (
      !body.hasOwnProperty("password") ||
      !body.hasOwnProperty("code") ||
      !body.hasOwnProperty("email")
    ) {
      log(
        `Erreur PUT/user/updatePassword => ${returnCode.missingParameters.payload.message}`,
        req.get("x-auth")
      );
      res
        .status(returnCode.missingParameters.code)
        .json(returnCode.missingParameters.payload);
    } else {
      try {
        const isFound = await db.queryParams(
          "SELECT DISTINCT count(*) as isFound FROM `reset_password` WHERE user = ? AND code= ?",
          [body.email, body.code]
        );
        if (isFound[0]["isFound"] === 0) {
          res
            .status(returnCode.wrongOTP.code)
            .json(returnCode.wrongOTP.payload);
        } else {
          await db.queryParams("DELETE FROM `reset_password` WHERE user = ?", [
            body.email,
          ]);
          const hashedPass = await password.hash(body.password);
          const response = await db.queryParams(
            "UPDATE `users` SET `mdp`=? WHERE `mail` = ?",
            [hashedPass, body.email]
          );
          res.status(200).json(response);
        }
      } catch (error: any) {
        log(
          `Erreur interne PUT/user/updatePassword => ${error.message}`,
          req.get("x-auth")
        );
        res
          .status(returnCode.internalError.code)
          .json(returnCode.internalError.payload);
      }
    }
  });

  /**
   * Route permettant de modifier l'adresse email
   * !! Nécessite l'authentification avec le header `x-auth` !!
   */
  app.put("/user/email", async function (req: Request, res: Response) {
    const body: UserChangeEmail = req.body;
    if (req.get("x-auth") === undefined) {
      res
        .status(returnCode.unauthorized.code)
        .json(returnCode.unauthorized.payload);
    } else if (!body.hasOwnProperty("email")) {
      log(
        `Erreur PUT/user/email => ${returnCode.missingParameters.payload.message}`,
        req.get("x-auth")
      );
      res
        .status(returnCode.missingParameters.code)
        .json(returnCode.missingParameters.payload);
    } else {
      try {
        const response = await db.queryParams(
          "UPDATE `users` SET `mail`=? WHERE `id` = ?",
          [body.email, req.get("x-auth")]
        );
        res.status(200).json(response);
      } catch (error: any) {
        log(
          `Erreur interne PUT/user/email => ${error.message}`,
          req.get("x-auth")
        );
        res
          .status(returnCode.internalError.code)
          .json(returnCode.internalError.payload);
      }
    }
  });

  /**
   * Route permettant de modifier le nom et le prénom
   * !! Nécessite l'authentification avec le header `x-auth` !!
   */
  app.put("/user/fullname", async function (req: Request, res: Response) {
    const body: UserChangeFullname = req.body;
    if (req.get("x-auth") === undefined) {
      res
        .status(returnCode.unauthorized.code)
        .json(returnCode.unauthorized.payload);
    } else if (
      !body.hasOwnProperty("firstname") ||
      !body.hasOwnProperty("lastname")
    ) {
      log(
        `Erreur PUT/user/fullname => ${returnCode.missingParameters.payload.message}`,
        req.get("x-auth")
      );
      res
        .status(returnCode.missingParameters.code)
        .json(returnCode.missingParameters.payload);
    } else {
      try {
        const response = await db.queryParams(
          "UPDATE `users` SET `prenom` = ?, `nom` = ? WHERE `id` = ?",
          [body.firstname, body.lastname, req.get("x-auth")]
        );
        res.status(200).json(response);
      } catch (error: any) {
        log(
          `Erreur interne PUT/user/fullname => ${error.message}`,
          req.get("x-auth")
        );
        res
          .status(returnCode.internalError.code)
          .json(returnCode.internalError.payload);
      }
    }
  });

  /**
   * Route permettant de mettre à jour les favoris des utilisateurs
   * !! Nécessite l'authentification avec le header `x-auth` !!
   */
  app.put("/user/favoris", async function (req: Request, res: Response) {
    const body: UserChangeFav = req.body;
    if (req.get("x-auth") === undefined) {
      res
        .status(returnCode.unauthorized.code)
        .json(returnCode.unauthorized.payload);
    } else if (!body.hasOwnProperty("favoris")) {
      log(
        `Erreur PUT/user/fullname => ${returnCode.missingParameters.payload.message}`,
        req.get("x-auth")
      );
      res
        .status(returnCode.missingParameters.code)
        .json(returnCode.missingParameters.payload);
    } else {
      try {
        const response = await db.queryParams(
          "UPDATE `users` SET `favoris` = ? WHERE `id` = ?",
          [body.favoris, req.get("x-auth")]
        );
        res.status(200).json(response);
      } catch (error: any) {
        log(
          `Erreur interne PUT/user/fullname => ${error.message}`,
          req.get("x-auth")
        );
        res
          .status(returnCode.internalError.code)
          .json(returnCode.internalError.payload);
      }
    }
  });
};

export default user;
