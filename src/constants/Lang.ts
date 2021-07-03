const locales = {
  fr: {
    passwordReset: {
      password_title: "Réinitialisation de mot de passe",
      password_subtext:
        "Vous avez demandé la réinitialisation de votre mot de passe via l'application mobile. Vous trouverez ci-joint le code à 6 chiffre vous permettant de valider la réinitialisation de ce dernier.",
      no_request_title: "Vous n'avez pas demandé la réinitialisation ?",
      no_request_message:
        "Nous vous recommandons de changer votre mot de passe. Vous pouvez également ignorer ce message si vous pensez que c'est une erreur.",
    },
  },
  en: {
    passwordReset: {
      password_title: "Password reset",
      password_subtext:
        "You have requested to reset your password via the mobile app. You will find attached the 6-digit code allowing you to validate the reset of the latter.",
      no_request_title: "Didn't ask for the reset?",
      no_request_message:
        "We recommend that you change your password. You can also ignore this message if you think it's an error.",
    },
  },
};

export const getLang = (languageCode: string) => {
  switch (languageCode) {
    case "fr":
      return locales.fr;
      break;
    case "en":
      return locales.en;
      break;

    default:
      return locales.en;
      break;
  }
};
