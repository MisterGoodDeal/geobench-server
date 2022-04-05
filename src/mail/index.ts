import { log } from "../db/logger";

const env = require("dotenv").config();
const nodemailer = require("nodemailer");

const transporter = nodemailer.createTransport({
  host: process.env.MAIL_HOST,
  port: process.env.MAIL_PORT,
  secure: true,
  auth: {
    user: process.env.MAIL_USER,
    pass: process.env.MAIL_PASSWORD,
  },
});

export const transporterTest = () => {
  transporter.verify(function (error: any, success: any) {
    if (error) {
      log(error);
    } else {
      log("Server is ready to take our messages");
    }
  });
};

export const sendMail = async (
  destinataire: string,
  sujet: string,
  html: string
) => {
  let transport = nodemailer.createTransport({
    host: "smtp.ionos.fr",
    port: 465,
    auth: {
      user: "geobench@turtlecorp.fr",
      pass: "&7@2H9f%B*hbe9iAC$&5",
    },
  });

  const message = {
    from: '"Geobench 🌳" <geobench@turtletv.fr>',
    to: destinataire,
    subject: sujet,
    html: html,
  };

  transport.sendMail(message, function (err: any, info: any) {
    if (err) {
      log(err);
    } else {
      log(info);
    }
  });
};

export const test = async () => {
  const mail = await sendMail(
    "mcamus@condotcet93.fr",
    "Sujet de test",
    "<h1>Mail de test</h1>"
  );
};
