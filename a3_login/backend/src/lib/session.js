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

export const checkAccessToken = (token) => {
  try{
    const SECRET = process.env.JWT_SECRET || "secret";

    // This will raise an error if the token signature is not correct or if the token 
    // is expired
    jwt.verify(token, SECRET, {
      ignoreExpiration: false,
    });
    
    return [null, true]
  }catch(err){
    return [err, false]; 
  }
}
