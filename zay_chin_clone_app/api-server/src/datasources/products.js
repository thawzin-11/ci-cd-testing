import { MongoDataSource } from "apollo-datasource-mongodb";

class Products extends MongoDataSource {
  async getAllProducts() {
    //data fetching
    const products = await this.collection.find().toArray();

    // transformation

    // console.log("products=", newProducts);
    return products;
  }
  async getCategoryNames() {
    const categories = await this.collection.distinct("category");
    return categories;
  }
  async findProductsByCategory(category) {
    const products = await this.collection
      .find({ category: category.name })
      .toArray();
    // console.log("productsxxxx=", products);

    return products;
  }
}

export default Products;
