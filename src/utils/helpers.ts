export const generateRandomString = (len?: number): string => {
  const length = len === undefined ? 16 : len;
  const characters =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

  let result = " ";
  const charactersLength = characters.length;
  for (let i = 0; i < length; i++) {
    result += characters.charAt(Math.floor(Math.random() * charactersLength));
  }

  return result;
};

export const addslashes = (str: string) => {
  return (str + "").replace(/([\\"'])/g, "\\$1").replace(/\0/g, "\\0");
};
