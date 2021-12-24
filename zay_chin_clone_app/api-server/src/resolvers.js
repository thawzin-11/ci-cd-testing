import { GraphQLUpload } from "graphql-upload";
import { v4 as uuidv4 } from "uuid";

const resolvers = {
  Query: {
    products: async (parent, args, context, info) => {
      // console.log("context=", context);
      const products = await context.dataSources.products.getAllProducts();
      return products;
    },
    categories: async (parent, args, context, info) => {
      const categories = await context.dataSources.products.getCategoryNames();
      const categoriesObjects = categories.map((c) => {
        return {
          name: c,
        };
      });
      return categoriesObjects;
    },
    users: async (parent, args, context, info) => {
      const users = await context.dataSources.users.getAllUsers();

      return users;
    },
    orders: async (parent, args, context, info) => {
      const { status } = args;
      const orders = await context.dataSources.orders.getAllOrders(status);
      // console.log('orders', orders);
      return orders;
    },
  },
  Upload: GraphQLUpload,

  Category: {
    products: async (parent, args, context, info) => {
      // console.log("parent=", parent);
      const products =
        await context.dataSources.products.findProductsByCategory(parent);
      return products;
    },
  },

  Mutation: {
    addUser: async (parent, args, context, info) => {
      const addedUser = await context.dataSources.users.addSingleUser(args);
      return {
        // code: 200,
        // success: true,
        user: {
          id: addedUser.insertedId,
          name: args.name,
          phNumber: args.phNumber,
        },
        message: "User Successfully Added",
        success: addedUser.acknowledged,
      };
    },
    addOrder: async (parent, args, context, info) => {
      try {
        const order = await context.dataSources.orders.addOrder(args);
        console.log("order=", order);
        return {
          success: true,
          message: "Order Successfully Added",
          order,
        };
      } catch (error) {
        console.log("error=", error);
        return {
          success: false,
          message: "Unknown Error",
        };
      }
    },
    register: async (parent, args, context, info) => {
      console.log("hit.args=", args);
      const data = await context.dataSources.users.register(args);
      console.log("data=", data);
      return {
        success: true,
        ...data,
      };
    },
    login: async (parent, args, context, info) => {
      const result = await context.dataSources.users.login(args);
      console.log("result=", result);
      return result;
    },
    logout: async (parent, args, context, info) => {
      return {
        success: true,
        msg: "logout succeeded",
        token: null,
      };
    },
    singleUpload: async (parent, { file }) => {
      const { createReadStream, filename, mimetype, encoding } = await file;
      const uuid = uuidv4();

      // Invoking the `createReadStream` will return a Readable Stream.
      // See https://nodejs.org/api/stream.html#stream_readable_streams
      const stream = createReadStream();

      // This is purely for demonstration purposes and will overwrite the
      // local-file-output.txt in the current working directory on EACH upload.
      const out = require("fs").createWriteStream(uuid);
      stream.pipe(out);
      await finished(out);

      return { uuid, mimetype, encoding };
    },
  },
};

export default resolvers;
