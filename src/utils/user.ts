import { db } from "../db";
const userExists = async (id: number): Promise<boolean> => {
  const rows = await db.queryParams(
    "SELECT COUNT(*) as userExist FROM `users` WHERE `id` = ?",
    [id]
  );

  //return rows[0].userExist === 1;
  if (rows[0].userExist === 1) {
    return true;
  } else {
    return false;
  }
};

export const user = {
  exists: userExists,
};

export interface User {
  id: number;
  is_ads: number;
  is_banned: number;
  is_deleted: number;
  prenom: string;
  nom: string;
  mail: string;
  pseudo: string;
  mdp: string;
  favoris: string;
  reset_key: string;
}
