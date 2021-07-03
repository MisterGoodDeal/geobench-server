export const returnCode = {
  missingParameters: {
    code: 400,
    payload: {
      title: "missing_parameters",
      message: "Missing parameters!",
    },
  },
  wrongOTP: {
    code: 400,
    payload: {
      title: "wrong_otp",
      message: "One Time Password is incorrect!",
    },
  },
  unknownUser: {
    code: 400,
    payload: {
      title: "unknown_user",
      message:
        "Unknown user! The user you trying to get insn't present in the database.",
    },
  },
  alreadyUser: {
    mail: {
      code: 400,
      payload: {
        title: "already_exists_mail",
        message: "The user you're trying to add already exists in the database",
      },
    },
    username: {
      code: 400,
      payload: {
        title: "already_exists_username",
        message: "The user you're trying to add already exists in the database",
      },
    },
    both: {
      code: 400,
      payload: {
        title: "already_exists_both",
        message: "The user you're trying to add already exists in the database",
      },
    },
  },
  userCreated: {
    code: 201,
    payload: {
      title: "user_created",
      message: "The user has been created successfully!",
    },
  },
  user: {
    wrongPassword: {
      code: 400,
      payload: {
        title: "wrong_password",
        message: "Password missmatch!",
      },
    },
  },
  unauthorized: {
    code: 401,
    payload: {
      title: "unauthorized",
      message: "You need to authetificate before using this route!",
    },
  },
  internalError: {
    code: 500,
    payload: {
      title: "internal_server_error",
      message: "Internal server error! Check logs",
    },
  },
};

export interface Res {
  status: (code: number) => any;
  json: (json: any) => any;
}
