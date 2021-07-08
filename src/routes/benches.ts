import { db } from "../db";
import { log } from "../db/logger";
import { AddBenchBody, AddCommentBody } from "../utils/benches";
import { addslashes } from "../utils/helpers";
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
        log(`Erreur interne GET/bancs => ${error.message}`, req.get("x-auth"));
        res
          .status(returnCode.internalError.code)
          .json(returnCode.internalError.payload);
      }
    }
  });

  /**
   * Route permettant de récupérer un JSON avec tous les bancs depuis la base de donnée
   * !! Nécessite l'authentification avec le header `x-auth` !!
   */
  app.put("/banc/commentaire", async function (req: any, res: Res) {
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
          const body: AddCommentBody = req.body;
          const commentaire = await db.queryParams(
            "SELECT commetaire FROM bancs WHERE id = ?",
            [body.banc]
          );
          const c = JSON.parse(commentaire[0].commetaire);
          c.communaute.push({ user: body.username, comment: body.commentaire });
          const resQ = await db.queryParams(
            "UPDATE `bancs` SET `commetaire`= ? WHERE `id` = ?",
            [JSON.stringify(c), body.banc]
          );
          if (resQ.affectedRows >= 1) {
            res.status(200).json({ status: "ok" });
          } else {
            log(
              `Erreur base de donnée PUT/banc/commentaire => ${resQ}`,
              req.get("x-auth")
            );
            res
              .status(returnCode.internalError.code)
              .json(returnCode.internalError.payload);
          }
        }

        res.status(200).json({ status: "ok" });
      } catch (error) {
        log(
          `Erreur interne PUT/banc/commentaire => ${error.message}`,
          req.get("x-auth")
        );
        res
          .status(returnCode.internalError.code)
          .json(returnCode.internalError.payload);
      }
    }
  });

  /**
   * Route permettant d'ajouter un banc en base de donnée
   * !! Nécessite l'authentification avec le header `x-auth` !!
   */
  app.post("/bancs", async function (req: any, res: Res) {
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
        const body: AddBenchBody = req.body;
        if (
          !body.hasOwnProperty("longitude") ||
          !body.hasOwnProperty("latitude") ||
          !body.hasOwnProperty("note") ||
          !body.hasOwnProperty("lieu") ||
          !body.hasOwnProperty("environnement") ||
          !body.hasOwnProperty("user") ||
          !body.hasOwnProperty("commetaire") ||
          !body.hasOwnProperty("nom_photo")
        ) {
          const properties = {
            longitude: body.hasOwnProperty("longitude"),
            latitude: body.hasOwnProperty("latitude"),
            note: body.hasOwnProperty("note"),
            lieu: body.hasOwnProperty("lieu"),
            environnement: body.hasOwnProperty("environnement"),
            user: body.hasOwnProperty("user"),
            commentaire: body.hasOwnProperty("commetaire"),
            nom_photo: body.hasOwnProperty("nom_photo"),
          };
          res
            .status(returnCode.missingParameters.code)
            .json(returnCode.missingParameters.payload);
        } else {
          const queryR = await db.queryParams(
            "INSERT INTO `bancs`(`longitude`, `latitude`, `lieu`, `note`, `environnement`, `user`, `commetaire`, `nom_photo`) VALUES (?,?,?,?,?,?,?,?)",
            [
              body.longitude,
              body.latitude,
              body.lieu,
              body.note,
              body.environnement,
              body.user,
              `{"utilisateur":"${body.commetaire}","communaute":[]}`,
              body.nom_photo,
            ]
          );
          res.status(200).json(queryR);
        }
      } catch (error) {
        log(`Erreur interne POST/bancs => ${error.message}`, req.get("x-auth"));
        res
          .status(returnCode.internalError.code)
          .json(returnCode.internalError.payload);
      }
    }
  });
};
