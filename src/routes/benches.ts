import { db } from "../db";
import { Res, returnCode } from "../utils/returnCodes";
import { user } from "../utils/user";
const env = require("dotenv").config();

interface Banc {
  id: number;
  longitude: number;
  latitude: number;
  lieu: string;
  note: number;
  environnement: string;
  user: string;
  commetaire: string;
  nom_photo: string;
  date: Date;
}

export const benches = (app: any) => {
  /**
   * Route permettant de récupérer un JSON avec tous les bancs depuis la base de donnée
   * !! Nécessite l'authentification avec le header `x-auth` !!
   */
  app.get("/bancs", async function (req: any, res: Res) {
    const benches: Banc[] = [];
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
        }
        const rows = await db.queryParams("SELECT * FROM `bancs` WHERE ?", [
          "1",
        ]);
        rows.map((b: Banc) => {
          benches.push({
            id: b.id,
            longitude: b.longitude,
            latitude: b.latitude,
            note: b.note,
            lieu: b.lieu,
            environnement: b.environnement,
            user: b.user,
            commetaire: b.commetaire,
            nom_photo: b.nom_photo,
            date: b.date,
          });
        });
        res.status(200).json(benches);
      } catch (error) {
        console.log(`Erreur interne GET/bancs => ${error.message}`);
        res
          .status(returnCode.internalError.code)
          .json(returnCode.internalError.payload);
      }
    }
  });
};
