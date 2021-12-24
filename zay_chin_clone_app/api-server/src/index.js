import { ApolloServerPluginDrainHttpServer } from "apollo-server-core";
import { ApolloServer } from "apollo-server-express";
import express from "express";
import { createServer } from "http";
import { getDb } from "./database.js";
import Orders from "./datasources/orders.js";
import Products from "./datasources/products.js";
import Users from "./datasources/users.js";
import resolvers from "./resolvers.js";
import typeDefs from "./schema.js";
import dotenv from "dotenv";
import { getUser } from "./auth.js";

dotenv.config();

const app = express();
app.use("/images", express.static("src/data-preparation/images"));
const httpServer = createServer(app);

async function startApolloServer(typeDefs, resolvers) {
  const db = await getDb();
  const server = new ApolloServer({
    typeDefs,
    resolvers,
    dataSources: () => ({
      products: new Products(db.collection("products")),
      users: new Users(db.collection("users")),
      orders: new Orders(db.collection("orders")),
    }),
    plugins: [ApolloServerPluginDrainHttpServer({ httpServer })],
    //extract token put user to context every request
    context: async ({ req }) => {
      const token = req.headers.authorization || "";
      const user = await getUser(token);

      return {
        user,
      };
    },
  });

  await server.start();
  server.applyMiddleware({
    app,

    // By default, apollo-server hosts its GraphQL endpoint at the
    // server root. However, *other* Apollo Server packages host it at
    // /graphql. Optionally provide this to match apollo-server.
    path: "/",
  });

  // Modified server startup
  await new Promise((resolve) => httpServer.listen({ port: 4000 }, resolve));
  console.log(`🚀 Server ready at http://localhost:4000${server.graphqlPath}`);
}

startApolloServer(typeDefs, resolvers);
