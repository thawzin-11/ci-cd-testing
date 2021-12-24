import { gql } from "apollo-server-core";

const typeDefs = gql`
  scalar Upload

  type File {
    filename: String!
    mimetype: String!
    encoding: String!
  }

  type Query {
    products: [Product!]
    categories: [Category]
    users: [User]
    orders(status: String): [Order]
  }

  type AddUserResponse {
    # code: Int!
    success: Boolean!
    message: String!
    user: User!
  }

  type Address {
    houseOrApartmentNo: String
    streetNo: String
    quarter: String
    township: String
    city: String
  }

  type Product {
    _id: ID
    name: String
    description: String
    priceUnit: String
    price: Int
    image: String
    category: String
    subcategory: String
  }

  input productInput {
    _id: ID
    name: String
    description: String
    priceUnit: String
    price: Int
    image: String
    category: String
    subcategory: String
  }

  type Category {
    name: String!
    products: [Product]
  }

  type User {
    _id: ID
    name: String!
    phNumber: String
    password: String
  }

  input UserInput {
    name: String!
    phNumber: String!
  }

  type orderProduct {
    productId: ID!
    name: String
    description: String
    priceUnit: String
    price: Int
    image: String
    qty: Int!
  }

  # input cartInput {
  #   total: Int
  #   cartItems: [
  #     {
  #       product: productInput
  #       qty: Int
  #     }
  #   ]
  # }

  # input cartItem {
  #   product:
  # }

  type Order {
    _id: ID!
    status: String
    customerName: String!
    deliveryPhNumber: String!
    address: Address
    deliveryDate: String
    paymentMethod: String
    promoCode: String
    note: String
    products: [orderProduct]
  }

  input OrderInput {
    customerName: String!
    deliveryPhNumber: String!
    address: orderAddressInput
    deliveryDate: String
    paymentMethod: String
    promoCode: String
    note: String
    products: [orderProductsInput]
  }

  input orderProductsInput {
    productId: ID!
    name: String
    description: String
    priceUnit: String
    price: Int
    image: String
    qty: Int!
  }

  input orderAddressInput {
    _id: ID
    houseOrApartmentNo: String
    streetNo: String
    quarter: String
    township: String
    city: String
  }

  type Mutation {
    addUser(name: String!, phNumber: String!): AddUserResponse!
    addOrder(orderInput: OrderInput): AddOrderResponse!
    register(
      name: String!
      phNumber: String!
      password: String!
    ): registerResponse!
    login(phNumber: String!, password: String!): loginResponse!
    logout: logoutResponse!
    singleUpload(file: Upload!): File!
  }

  type AddOrderResponse {
    success: Boolean
    message: String
    order: Order
  }

  type registerResponse {
    success: Boolean
    token: String
    user: User
  }

  type logoutResponse {
    success: Boolean
    token: String
    msg: String
  }

  type loginResponse {
    success: Boolean
    token: String
    user: User
    msg: String
  }
`;

export default typeDefs;
