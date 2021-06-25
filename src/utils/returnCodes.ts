export const returnCode = {
  unknownUser: {
    code: 400,
    payload: {
      title: "unknown_user",
      error: "Unknown users!",
    },
  },
  unauthorized: {
    code: 401,
    payload: {
      title: "unauthorized",
      error: "You need to authetificate before using this route!",
    },
  },
  internalError: {
    code: 500,
    payload: {
      title: "internal_server_error",
      error: "Internal server error! Check logs",
    },
  },
};
