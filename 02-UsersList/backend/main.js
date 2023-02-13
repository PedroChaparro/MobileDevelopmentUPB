import express from "express";
import { faker } from "@faker-js/faker";
import { getRandomCareer, getRandomProfileImage } from "./utils.js";
const app = express();

app.get("/users", (req, res) => {
  const users = new Array(25).fill().map((position) => {
    return {
      fullname: faker.name.fullName(),
      image: getRandomProfileImage(),
      //image: faker.image.avatar(),
      average: (Math.random() * 5.0).toFixed(2),
      career: getRandomCareer(),
    };
  });

  res.json({ users });
});

app.listen(3000);
