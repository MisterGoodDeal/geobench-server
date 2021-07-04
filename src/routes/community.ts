import { db } from "../db";
import { Res, returnCode } from "../utils/returnCodes";
import { user } from "../utils/user";
const env = require("dotenv").config();

export const community = (app: any) => {
  /**
   * Route permettant de récupérer une image aléatoire d'un banc d'un utilisateur
   * !! Nécessite l'authentification avec le header `x-auth` !!
   */
  app.get("/community/randomPhoto", async function (req: any, res: Res) {
    if (req.get("x-auth") === undefined) {
      res
        .status(returnCode.unauthorized.code)
        .json(returnCode.unauthorized.payload);
    } else {
      try {
        if (!(await user.exists(parseInt(req.get("x-auth"))))) {
          res
            .status(returnCode.unknownUser.code)
            .json(returnCode.unknownUser.payload);
        } else {
          const response = await db.query(
            "SELECT `user`,`nom_photo` FROM bancs WHERE `nom_photo` != '' ORDER BY RAND() LIMIT 1"
          );
          res
            .status(200)
            .json({ user: response[0].user, url: response[0].nom_photo });
        }
      } catch (error) {
        console.log(`Erreur interne GET/bancs => ${error.message}`);
        res
          .status(returnCode.internalError.code)
          .json(returnCode.internalError.payload);
      }
    }
  });
};
