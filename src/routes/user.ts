import { db } from "../db";
import { generateRandomString } from "../utils/helpers";
import { password } from "../utils/password";
import { Res, returnCode } from "../utils/returnCodes";
import {
  User,
  user as userUtils,
  UserLogin,
  UserRegister,
} from "../utils/user";

export const user = (app: any) => {
  /**
   * Route permettant de récupérer un JSON avec tous les bancs depuis la base de donnée
   * !! Nécessite l'authentification avec le header `x-auth` !!
   */
  app.get("/user/info", async function (req: any, res: Res) {
    if (req.get("x-auth") === undefined) {
      res
        .status(returnCode.unauthorized.code)
        .json(returnCode.unauthorized.payload);
    } else {
      try {
        if (!(await userUtils.exists(parseInt(req.get("x-auth"))))) {
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
      } catch (error) {
        console.log(`Erreur interne GET/user/info => ${error.message}`);
        res
          .status(returnCode.internalError.code)
          .json(returnCode.internalError.payload);
      }
    }
  });

  /**
   * Route permettant d'enregistrer un nouvel utilisateur en base de donnée'
   */
  app.post("/user/register", async function (req: any, res: Res) {
    const body: UserRegister = req.body;
    if (
      !body.hasOwnProperty("prenom") ||
      !body.hasOwnProperty("nom") ||
      !body.hasOwnProperty("email") ||
      !body.hasOwnProperty("password") ||
      !body.hasOwnProperty("username")
    ) {
      console.log(
        `Erreur POST/user/register => ${returnCode.missingParameters.payload.message}`
      );
      res
        .status(returnCode.missingParameters.code)
        .json(returnCode.missingParameters.payload);
    } else {
      const userRegisterExists = await userUtils.existsRegister(
        body.email,
        body.username
      );
      if (userRegisterExists.email || userRegisterExists.username) {
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
          favoris: "",
          reset_key: generateRandomString(32),
        };
        try {
          const query = await db.queryParams(
            "INSERT INTO `users`(`prenom`, `nom`, `mail`, `pseudo`, `mdp`, `favoris`, `reset_key`) VALUES (?, ?, ?, ?, ?, ?, ?)",
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
          console.log(query);
        } catch (error) {
          console.log(`Erreur interne POST/user/register => ${error.message}`);
          res
            .status(returnCode.internalError.code)
            .json(returnCode.internalError.payload);
        }
      }
      res
        .status(returnCode.userCreated.code)
        .json(returnCode.userCreated.payload);
    }
  });

  /**
   * Route permettant de connecter un utilisateur
   */
  app.post("/user/login", async function (req: any, res: Res) {
    const body: UserLogin = req.body;
    if (!body.hasOwnProperty("login") || !body.hasOwnProperty("password")) {
      console.log(
        `Erreur POST/user/login => ${returnCode.missingParameters.payload.message}`
      );
      res
        .status(returnCode.missingParameters.code)
        .json(returnCode.missingParameters.payload);
    } else {
      const isUser = await userUtils.existsRegister(body.login, body.login);
      if (isUser.email || isUser.username) {
        const user = await userUtils.info(body.login);
        const passwordMatch = await password.verify(body.password, user.mdp!);
        if (passwordMatch) {
          delete user.mdp;
          res.status(200).json(user);
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
};
