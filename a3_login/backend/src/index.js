import express from "express";
import dotenv from "dotenv";
import morgan from "morgan";
import { users } from "./storage/users.js";
import { createAccessToken, checkAccessToken } from "./lib/session.js";
dotenv.config();

const app = express();
const port = process.env.PORT || 3030;
app.use(express.json());
app.use(morgan('tiny'));

// Routes
app.post("/login", (req, res) => {
  console.log(req.body);
  if (!req.body) {
    return res.status(400).json({ messae: "JSON payload must be provided" });
  }

  // Get username and password fields
  const { username, password } = req.body;
  if (!username || !password) {
    return res
      .status(400)
      .json({ messae: "Username and password fields are required" });
  }

  // Search user on the users array
  const user = users.filter((user) => user.username == username)[0];
  if (!user) {
    return res.status(404).json({ message: "Username was not found" });
  }

  // Check password equality
  if (user.password !== password) {
    return res.status(401).json({ message: "Password is not valid" });
  }

  // Create a new accesokens t
  const token = createAccessToken(user);
  return res.json({ username: user.username, accessToken: token });
});

// Route to validte if the given token is valid
// Requires the jwt as Authorization header
app.get("/token/validate", (req, res) => {
  const authHeader = req.headers["authorization"];

  if (!authHeader) {
    return res.status(401).send({
      "message": "Authorization header must be provided"
    })
  }

  // Check if the token is valid
  const [err, success] = checkAccessToken(authHeader);

  if(!success){
    const { name } = err;

    const errors = {
      "TokenExpiredError": "Token is expired.",
      "JsonWebTokenError": "Token is not valid."
    }
    
    return res.status(403).json({
      error: true, 
      message: errors[name] || "Unexpected error when validating the token"
    })
  }

  return res.send({
    "error": false, 
    "message": "Token is valid"
  })
})

// Serve
app.listen(port, () => {
  console.log(`Server listening at localhost:${port}`);
});
