import { MongoDataSource } from "apollo-datasource-mongodb";
import bcrypt from "bcryptjs";
import jsonwebtoken from "jsonwebtoken";

const { sign } = jsonwebtoken;
const { hashSync, compareSync } = bcrypt;

class UsersDataSource extends MongoDataSource {
  async register(userInput) {
    console.log("hit");
    const result = await this.collection.insertOne({
      name: userInput.name,
      phNumber: userInput.phNumber,
      password: hashSync(userInput.password, 8),
    });

    const user = await this.collection.findOne({
      _id: result.insertedId,
    });

    console.log("user=", user);

    const token = sign({ id: user._id }, process.env.JWT_SECRET, {
      expiresIn: 86400, //24hrs
    });

    return {
      token,
      user,
    };
  }

  async login(loginInput) {
    try {
      const user = await this.collection.findOne({
        phNumber: loginInput.phNumber,
      });

      if (!user) {
        console.log("user not found");
        return {
          success: false,
          user: null,
          token: null,
          msg: "user not found",
        };
      }

      const passwordIsValid = compareSync(loginInput.password, user.password);
      if (!passwordIsValid) {
        console.log("Password not valid");
        return {
          success: false,
          user: null,
          token: null,
          msg: "password not valid",
        };
      }

      const token = sign({ id: user._id }, process.env.JWT_SECRET, {
        expiresIn: 86400,
      });

      return {
        success: true,
        user,
        token,
        msg: "success",
      };
    } catch (error) {
      console.log("unexpected error");
      return {
        success: false,
        user: null,
        token: null,
        msg: "error while processing",
      };
    }
  }

  async getAllUsers() {
    // console.log("collection=", this.collection);
    const users = await this.collection.find().toArray();
    // console.log("users=", users);
    return users;
  }

  // async addSingleUser(userData) {
  //     const addUser = await this.collection.insertOne(userData);
  //     return addUser;
  // };
}

export default UsersDataSource;
