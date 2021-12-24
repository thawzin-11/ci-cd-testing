//DB ထဲက category distint ကိုဆွဲထုတ်
// db.Products.distinct('category'); ["Beverage", "Food"]
const chickenLeg = {
  _id: "617fbe201f27f23a9adfe075",
  name: "Chicken Leg",
  description: "Good for Health",
  category: "Meat & Seafood",
  image: `${process.env.url}/images/Chicken Leg.jpg`,
  subcategory: "Chicken",
  price: 1000,
  priceUnit: "EA",
  stock: 5,
};

const chickenDrumstick = {
  _id: "617fbe201f27f23a9adfe076",
  name: "Chicken Drumstick",
  description: "Good for Health",
  category: "Meat & Seafood",
  image: `${process.env.url}/images/Chicken Drumstick.jpg`,
  subcategory: "Chicken",
  price: 1000,
  priceUnit: "EA",
  stock: 10,
};

const porkBellySlice = {
  _id: "617fbe201f27f23a9adfe077",
  name: "Pork Belly Slice",
  description: "Good for Health",
  category: "Meat & Seafood",
  subcategory: "Pork",
  image: `${process.env.url}/images/Pork Belly Slice.jpg`,
  price: 1000,
  priceUnit: "EA",
  stock: 20,
};

const porkNeck = {
  _id: "617fbe201f27f23a9adfe078",
  name: "Pork Neck",
  description: "Good for Health",
  category: "Meat & Seafood",
  subcategory: "Pork",
  image: `${process.env.url}/images/Pork Neck.jpg`,
  price: 2000,
  priceUnit: "kg",
  stock: 15,
};

const apple = {
  _id: "617fbe201f27f23a9adfe079",
  name: "Apple",
  description: "Good for Health",
  category: "Fruits & Vegetables",
  subcategory: "Fruits",
  image: `${process.env.url}/images/Apple.jpg`,
  price: 500,
  priceUnit: "EA",
  stock: 5,
};

const banana = {
  _id: "617fbe201f27f23a9adfe07a",
  name: "Banana",
  description: "Good for Health",
  category: "Fruits & Vegetables",
  subcategory: "Fruits",
  image: `${process.env.url}/images/Banana.jpg`,
  price: 1000,
  priceUnit: "EA",
  stock: 30,
};

const orange = {
  _id: "617fbe201f27f23a9adfe07b",
  name: "Orange",
  description: "Good for Health",
  category: "Fruits & Vegetables",
  subcategory: "Fruits",
  image: `${process.env.url}/images/Orange.jpg`,
  price: 700,
  priceUnit: "EA",
  stock: 20,
};

const carrot = {
  _id: "617fbe201f27f23a9adfe07c",
  name: "Carrot",
  description: "Good for Health",
  category: "Fruits & Vegetables",
  subcategory: "Fruits",
  image: `${process.env.url}/images/Carrot.jpg`,
  price: 700,
  priceUnit: "EA",
  stock: 40,
};

const goldLabel = {
  _id: "617fbe201f27f23a9adfe07d",
  name: "Gold Label",
  description: "Good for Health",
  category: "Liquor",
  subcategory: "Whiskey",
  image: `${process.env.url}/images/Gold Label.jpg`,
  price: 30000,
  priceUnit: "EA",
  stock: 100,
};

const hibiki = {
  _id: "617fbe201f27f23a9adfe07e",
  name: "Hibiki",
  description: "Good for Health",
  category: "Liquor",
  subcategory: "Whiskey",
  image: `${process.env.url}/images/Hibiki.jpg`,
  price: 30000,
  priceUnit: "EA",
  stock: 10,
};

const glenfiddich = {
  _id: "617fbe201f27f23a9adfe07f",
  name: "Glenfiddich",
  description: "Good for Health",
  category: "Liquor",
  subcategory: "Whiskey",
  image: `${process.env.url}/images/Glenfiddich.jpg`,
  price: 30000,
  priceUnit: "EA",
  stock: 5,
};

const sunkist = {
  _id: "617fbe201f27f23a9adfe080",
  name: "Sunkist",
  description: "Good for Health",
  category: "Beverages & Snacks",
  subcategory: "Soft Drink",
  image: `${process.env.url}/images/Sunkist.jpg`,
  price: 500,
  priceUnit: "EA",
  stock: 3,
};

const dPopCola = {
  _id: "617fbe201f27f23a9adfe081",
  name: "D-pop Cola",
  description: "Good for Health",
  category: "Beverages & Snacks",
  subcategory: "Soft Drink",
  image: `${process.env.url}/images/D-pop Cola.jpg`,
  price: 500,
  priceUnit: "EA",
  stock: 20,
};

const nescafe = {
  _id: "617fbe201f27f23a9adfe082",
  name: "Nescafe",
  description: "Good for Health",
  category: "Beverages & Snacks",
  subcategory: "Soft Drink",
  image: `${process.env.url}/images/Nescafe.jpg`,
  price: 800,
  priceUnit: "EA",
  stock: 50,
};

export default [
  chickenLeg,
  chickenDrumstick,
  porkBellySlice,
  porkNeck,
  apple,
  banana,
  orange,
  carrot,
  goldLabel,
  hibiki,
  glenfiddich,
  sunkist,
  dPopCola,
  nescafe,
];
