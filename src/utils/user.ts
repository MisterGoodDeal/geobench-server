import { db } from "../db";
// Fonctions

const userExists = async (id: number): Promise<boolean> => {
  const rows = await db.queryParams(
    "SELECT COUNT(*) as userExist FROM `users` WHERE `id` = ?",
    [id]
  );
  if (rows[0].userExist === 1) {
    return true;
  } else {
    return false;
  }
};

const getUserRegister = async (login: string): Promise<User> => {
  const rows = await db.queryParams(
    "SELECT DISTINCT * FROM `users` WHERE `mail` = ? OR `pseudo` = ?",
    [login, login]
  );
  const user: User = rows[0];
  return user;
};

const checkRegisterUserExist = async (
  email: string,
  username: string
): Promise<CheckUserRegisterExist> => {
  const mail = await db.queryParams(
    "SELECT DISTINCT COUNT(*) as userExist FROM `users` WHERE `mail` = ?",
    [email]
  );
  const pseudo = await db.queryParams(
    "SELECT DISTINCT COUNT(*) as userExist FROM `users` WHERE `pseudo` = ?",
    [username]
  );
  return {
    email: mail[0].userExist === 1 ? true : false,
    username: pseudo[0].userExist === 1 ? true : false,
  };
};

export const user = {
  exists: userExists,
  existsRegister: checkRegisterUserExist,
  info: getUserRegister,
};

// Interfaces

export interface User {
  id?: number;
  is_ads?: number;
  is_banned?: number;
  is_deleted?: number;
  prenom: string;
  nom: string;
  mail: string;
  pseudo: string;
  mdp?: string;
  favoris: string;
  reset_key: string;
}

export interface UserRegister {
  prenom: string;
  nom: string;
  email: string;
  username: string;
  password: string;
}

export interface UserLogin {
  login: string;
  password: string;
}

interface CheckUserRegisterExist {
  email: boolean;
  username: boolean;
}
