import jwt from "jsonwebtoken";

export const createAccessToken = (user) => {
  const SECRET = process.env.JWT_SECRET || "secret";
  const { username } = user;

  // Create an return the session token
  const token = jwt.sign({ username }, SECRET, {
    expiresIn: "30d",
  });

  return token;
};
