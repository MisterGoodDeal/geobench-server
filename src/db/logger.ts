import { db } from ".";

export const log = async (message: any, user?: string) => {
  const msgDb = typeof message === "object" ? JSON.stringify(message) : message;
  await db.queryParams("INSERT INTO `server_log`(`log`, `user`) VALUES (?,?)", [
    msgDb,
    user === undefined ? -1 : parseInt(user),
  ]);
  console.log(message);
};
