import { getDb } from "../database.js";
import users from "./users.js";
import orders from "./orders.js";
import addresses from "./addresses.js";
import products from "./products.js";
import dotenv from "dotenv";

dotenv.config();

async function seedProducts(clearCollection = true) {
  const db = await getDb();
  if (clearCollection) {
    await db.collection("products").deleteMany({});
  }

  await db.collection("products").insertMany(products);
}

async function seedDb() {

  const db = await getDb();

  //purge previous data
  await db.collection("users").deleteMany({});
  await db.collection("orders").deleteMany({});

  //add new data
  await seedProducts();
  await db.collection("users").insertMany(users);
  await db.collection("orders").insertMany(orders);

  const user = await db.collection("users").findOne({
    _id: "61824e0b3f25fcf95a389171",
  });
  console.log("user=", user);
}

seedDb()
  .then(() => {
    console.log("db seeded");
    process.exit(0);
  })
  .catch((error) => {
    console.log(error);
    throw new Error("Error while seeding");
  });
