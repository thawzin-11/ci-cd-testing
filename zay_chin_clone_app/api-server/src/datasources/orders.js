import { MongoDataSource } from "apollo-datasource-mongodb";

class Orders extends MongoDataSource {
  async getAllOrders(status) {
    const orders = await this.collection
      .find(status ? { status } : {})
      .toArray();
    // console.log(orders);

    return orders;
  }

  getProductsFromOrder(order) {
    // console.log('listofProducts=', order.products)
    const listOfProducts = order.products;
    return listOfProducts;
  }

  getUserFromOrder(order) {
    const orderUser = order.user;
    return {
      name: orderUser.name,
      phNumber: orderUser.phNumber,
    };
  }
  async addOrder({ orderInput }) {
    console.log("orderInput=", orderInput);
    const result = await this.collection.insertOne({
      status: "pending",
      ...orderInput,
    });
    console.log("result=", result);
    const order = await this.collection.findOne({
      _id: result.insertedId,
    });
    console.log("addOrder=", order);
    return order;
  }
}

export default Orders;
