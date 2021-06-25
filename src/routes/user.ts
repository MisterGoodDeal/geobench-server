import { db } from "../db";
import { returnCode } from "../utils/returnCodes";
import { User, user as userUtils } from "../utils/user";

export const user = (app: any) => {
  /**
   * Route permettant de récupérer un JSON avec tous les bancs depuis la base de donnée
   * !! Nécessite l'authentification avec le header `x-auth` !!
   */
  app.get("/user/info", async function (req: any, res: any) {
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
};
