import { Request, Response } from "express";
import { db } from "../db";
import { log } from "../db/logger";
import { generateRandomString } from "../utils/helpers";
import { MySQLResponse } from "../utils/interfaces";
import { password } from "../utils/password";
import { Res, returnCode } from "../utils/returnCodes";
import {
  AppleUserDb,
  User,
  user as userUtils,
  UserApple,
  UserRegister,
} from "../utils/user";

const registration = (app: any) => {
  /**
   * Route permettant d'enregistrer un nouvel utilisateur en base de données
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
   * Handle "Login with Apple"
   */
  app.post("/user/apple", async function (req: Request, res: Response) {
    const body: UserApple = req.body;
    if (
      !body.authorizationCode ||
      !body.identityToken ||
      !body.nonce ||
      !body.user
    ) {
      res
        .status(returnCode.missingParameters.code)
        .json(returnCode.missingParameters.payload);
    } else {
      if (body.prenom && body.nom && body.email) {
        // Handle new user
        const userExists = await userUtils.existsRegister(body.email, "");
        if (userExists.email) {
          res
            .status(returnCode.alreadyUser.mail.code)
            .json(returnCode.alreadyUser.mail.payload);
        } else {
          const addAppleUser: MySQLResponse = await db.queryParams(
            "INSERT INTO `geobench`.`apple_users` (`user_id`,`identify_token`,`authorization_code`,`nonce`) VALUES (?, ?, ?, ?);",
            [body.user, body.identityToken, body.authorizationCode, body.nonce]
          );

          const pseudo = `${body.email.split("@")[0]}.${
            body.email.split("@")[1].split(".")[0]
          }`;
          const addUser: MySQLResponse = await db.queryParams(
            "INSERT INTO `geobench`.`users` (`prenom`,`nom`,`mail`,`pseudo`,`mdp`,`favoris`,`reset_key`,`platform`, `external_user`, `external_user_id`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
            [
              body.prenom,
              body.nom,
              body.email,
              pseudo,
              "",
              "[]",
              "",
              "ios",
              "apple",
              addAppleUser.insertId,
            ]
          );

          if (addUser.affectedRows === 1) {
            // get apple user
            const appleUser: AppleUserDb[] = await db.queryParams(
              "SELECT id FROM `apple_users` WHERE `user_id` = ?",
              [body.user]
            );

            const user: User[] = await db.queryParams(
              "SELECT * FROM `users` WHERE `external_user_id` = ?",
              [appleUser[0].id]
            );

            delete user[0].mdp;

            res.status(200).json(user[0]);
          } else {
            res
              .status(returnCode.internalError.code)
              .json(returnCode.internalError.payload);
          }
        }
      } else {
        // get apple user
        const appleUser: AppleUserDb[] = await db.queryParams(
          "SELECT id FROM `apple_users` WHERE `user_id` = ?",
          [body.user]
        );

        const user: User[] = await db.queryParams(
          "SELECT * FROM `users` WHERE `external_user_id` = ?",
          [appleUser[0].id]
        );

        delete user[0].mdp;

        res.status(200).json(user[0]);
      }
    }
  });
};

export default registration;
