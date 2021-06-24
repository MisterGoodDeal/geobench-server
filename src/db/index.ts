const env = require("dotenv").config();
const mysql = require("mysql2/promise");

async function queryWithoutParams(sql: string) {
  const connection = await mysql.createConnection(config.db);
  const [results] = await connection.execute(sql);

  return results;
}
async function queryWithParams(sql: string, params: any) {
  const connection = await mysql.createConnection(config.db);
  const [results] = await connection.execute(sql, params);

  return results;
}

const config = {
  db: {
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DB,
  },
  listPerPage: 10,
};

export const db = {
  query: queryWithoutParams,
  queryParams: queryWithParams,
};
