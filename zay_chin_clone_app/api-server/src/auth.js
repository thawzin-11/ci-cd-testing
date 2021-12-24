import jwt from "jsonwebtoken";
import { getDb } from "./database.js";

export const getUser = async (token) => {
  // console.log("token=");
  try {
    const { id } = jwt.verify(token, process.env.JWT_SECRET);
    const db = await getDb();
    const user = db.collection("users").findOne({
      _id: id,
    });
    console.log("user=", user);
    return user;
  } catch (error) {
    console.log("error in verifying token.");
    return null;
  }
};
