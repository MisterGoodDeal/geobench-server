import { Request, Response } from "express";
import { db } from "../db";
import { log } from "../db/logger";
import { returnCode } from "../utils/returnCodes";
import { user } from "../utils/user";
const env = require("dotenv").config();

export const community = (app: any) => {
  /**
   * Route permettant de récupérer une image aléatoire d'un banc d'un utilisateur
   * !! Nécessite l'authentification avec le header `x-auth` !!
   */
  app.get("/community", async function (req: Request, res: Response) {
    if (req.get("x-auth") === undefined) {
      res
        .status(returnCode.unauthorized.code)
        .json(returnCode.unauthorized.payload);
    } else {
      try {
        if (!(await user.exists(parseInt(req.get("x-auth") ?? "")))) {
          res
            .status(returnCode.unknownUser.code)
            .json(returnCode.unknownUser.payload);
        } else {
          // Get a random background
          const background = await db.query(
            "SELECT `user`,`nom_photo` FROM bancs WHERE `nom_photo` != '' ORDER BY RAND() LIMIT 1"
          );
          const benchCount = await db.query(
            "SELECT count(id) as benchCount FROM bancs WHERE 1"
          );
          const benchUser = await db.queryParams(
            "SELECT count(*) as benchCount FROM bancs FULL JOIN users ON `user` = users.pseudo WHERE users.id = ?",
            [req.get("x-auth")]
          );
          const usersCount = await db.query(
            "SELECT count(id) as usersCount FROM users WHERE 1"
          );
          const photosCount = await db.query(
            "SELECT count(id) as photosCount FROM bancs WHERE `nom_photo` != ''"
          );
          const photosUser = await db.queryParams(
            "SELECT count(*) as photosCount FROM bancs FULL JOIN users ON `user` = users.pseudo WHERE users.id = ? AND nom_photo != ''",
            [req.get("x-auth")]
          );
          const avgBench = await db.queryParams(
            "SELECT AVG(note) as avgBench FROM bancs FULL JOIN users ON `user` = users.pseudo WHERE users.id = ?",
            [req.get("x-auth")]
          );
          const usersPictures = await db.queryParams(
            "SELECT nom_photo as photo FROM bancs FULL JOIN users ON `user` = users.pseudo WHERE users.id = ? AND nom_photo != ''",
            [req.get("x-auth")]
          );
          const allPictures = await db.queryParams(
            "SELECT nom_photo as photo FROM bancs WHERE nom_photo != ''",
            [req.get("x-auth")]
          );

          res.status(200).json({
            global: {
              usersCount: usersCount[0].usersCount,
              benchCount: benchCount[0].benchCount,
              photosCount: photosCount[0].photosCount,
              pictures: allPictures,
            },
            user: {
              benchCount: benchUser[0].benchCount,
              photosCount: photosUser[0].photosCount,
              pictures: usersPictures,
              avgBench: {
                full: avgBench[0].avgBench,
                floor: Math.floor(avgBench[0].avgBench * 100) / 100,
                text: `${Math.floor(avgBench[0].avgBench * 100) / 100}/5`,
              },
            },
            background: {
              user: background[0].user,
              url: background[0].nom_photo,
            },
          });
        }
      } catch (error: any) {
        log(`Erreur interne GET/bancs => ${error.message}`, req.get("x-auth"));
        res
          .status(returnCode.internalError.code)
          .json(returnCode.internalError.payload);
      }
    }
  });
};
