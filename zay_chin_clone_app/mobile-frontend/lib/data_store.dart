class Category {
  String name;
  // List<SubCategory> subCategory;
  // List<Product> product;

  Category({required this.name});
}

class SubCategory {
  String name;
  Category category;
  // List<Product> product;

  SubCategory({required this.name, required this.category});
}

class Product {
  String name;
  String price;
  String image;
  SubCategory subCategory;
  Category category;

  Product(
      {required this.name,
      required this.price,
      required this.image,
      required this.subCategory,
      required this.category});
}

class DataStore {
  late List<Category> categories;
  late List<SubCategory> subCateories;
  late List<Product> products;

  DataStore() {
    var meatSeafood = Category(name: 'Meat & Seafood');
    var fruitsVegetable = Category(name: 'Fruits & Vegetables');
    var groceryAndDryGood = Category(name: 'Grocery & Dry Goods');
    var breakfastAndDairy = Category(name: 'Breakfast & Dairy');
    var beverageAndSnack = Category(name: 'Beverages & Snacks');
    var alcohol = Category(name: 'Alcohol');
    this.categories = [
      meatSeafood,
      fruitsVegetable,
      groceryAndDryGood,
      breakfastAndDairy,
      beverageAndSnack,
      alcohol,
    ];

    var chicken = SubCategory(name: 'Chicken', category: meatSeafood);
    var pork = SubCategory(name: 'Pork', category: meatSeafood);
    var frog = SubCategory(name: 'Forg', category: meatSeafood);
    var fish = SubCategory(name: 'Fish', category: meatSeafood);

    var beanAndCorn =
        SubCategory(name: 'Bean, Corn & More', category: fruitsVegetable);
    var broccoliAndCauliflower = SubCategory(
        name: 'Broccoli, Cauliflower & Cabbage', category: fruitsVegetable);
    var budsAndShoots =
        SubCategory(name: 'Buds & Shoots', category: fruitsVegetable);
    var chilliAndLemon = SubCategory(
        name: 'Chilli, Lemon, Carlic & Ginger', category: fruitsVegetable);
    var fruit = SubCategory(name: 'Fruits', category: fruitsVegetable);

    var whiskey = SubCategory(name: 'Whiskey', category: alcohol);
    var beer = SubCategory(name: 'Beer', category: alcohol);

    var softDrink = SubCategory(name: 'Soft Drink', category: beverageAndSnack);

    this.subCateories = [
      chicken,
      pork,
      frog,
      fish,
      beanAndCorn,
      broccoliAndCauliflower,
      budsAndShoots,
      chilliAndLemon,
      fruit,
      whiskey,
      beer,
      softDrink
    ];

    var chickenLeg = Product(
        name: 'Chicken leg',
        price: '1000 Ks',
        image:
            'https://zaychin.sgp1.cdn.digitaloceanspaces.com/new/products/6704/2f93554226ba33c71658c252b4b6319a-160.jpg?2021-07-12',
        category: meatSeafood,
        subCategory: chicken);

    var chickenMeat = Product(
        name: 'Chicken Drumstick',
        price: '1000 Ks',
        image:
            'https://zaychin.sgp1.cdn.digitaloceanspaces.com/new/products/6690/c6fdd6be23314b8f78c41fc655842392-160.jpg?2021-07-12',
        subCategory: chicken,
        category: meatSeafood);

    var porkBellySlice = Product(
        name: 'Pork Belly Slice',
        price: '1000 Ks',
        image:
            'https://zaychin.sgp1.cdn.digitaloceanspaces.com/new/products/6913/76eeaf1c978537354544ea33c607cda6-160.jpg?2021-07-12',
        category: meatSeafood,
        subCategory: pork);

    var porkEars = Product(
        name: 'Pork Neck',
        price: '1000 Ks',
        image:
            'https://zaychin.sgp1.cdn.digitaloceanspaces.com/new/products/6722/99eac65b61bb46bf18fe39d96e2016e4-160.jpg?2021-07-12',
        category: meatSeafood,
        subCategory: pork);

    var apple = Product(
        name: 'Apple',
        price: '1000 Ks',
        image:
            'https://zaychin.sgp1.cdn.digitaloceanspaces.com/new/products/6348/7456e3f2ec89fb09c52804aebba11930-160.jpg?2021-07-12',
        category: fruitsVegetable,
        subCategory: fruit);

    var banana = Product(
        name: 'Banana',
        price: '1000 Ks',
        image:
            'https://zaychin.sgp1.cdn.digitaloceanspaces.com/new/products/409/6295d0b28ce6020c060f6a6ce28ac25d-160.jpg?2021-07-12',
        subCategory: fruit,
        category: fruitsVegetable);

    var carrot = Product(
        name: 'Orange',
        price: '1000 Ks',
        image:
            'https://zaychin.sgp1.cdn.digitaloceanspaces.com/new/products/5780/8a2c8fd9536f770bebbb71ee3172fef5-160.jpg?2021-07-12',
        subCategory: fruit,
        category: fruitsVegetable);

    var goldLabel = Product(
        name: 'Gold Label',
        price: '1000 Ks',
        image:
            'https://cdn.shopify.com/s/files/1/0264/4521/7828/products/Gold_label_reserve_180x.jpg?v=1606929286',
        subCategory: whiskey,
        category: alcohol);

    var hibiki = Product(
        name: 'Hibiki',
        price: '1000 Ks',
        image:
            'https://cdn.shopify.com/s/files/1/0264/4521/7828/products/Hibiki_Japnese_Whisky_180x.png?v=1606929299',
        subCategory: whiskey,
        category: alcohol);

    var glenfiddich = Product(
        name: 'Glenfiddich',
        price: '1000 Ks',
        image:
            'https://cdn.shopify.com/s/files/1/0264/4521/7828/products/glenfiddich_12yo_700ml_bottle_group_5010327115115_aus_220x.jpg?v=1606929290',
        subCategory: whiskey,
        category: alcohol);

    var maxPlus = Product(
        name: 'Sunkist',
        price: '1000 Ks',
        image:
            'https://zaychin.sgp1.cdn.digitaloceanspaces.com/new/products/232/94085fb6e954be378e162b9567102d84-160.jpg?2021-07-12',
        subCategory: softDrink,
        category: beverageAndSnack);

    var milo = Product(
        name: 'D-pop Cola',
        price: '100 Ks',
        image:
            'https://zaychin.sgp1.cdn.digitaloceanspaces.com/new/products/7527/f10eb575e55ea8d69ecb2c51c01e7025-160.jpg?2021-07-12',
        subCategory: softDrink,
        category: beverageAndSnack);

    var nescafe = Product(
        name: 'Nescafe',
        price: '1000 Ks',
        image:
            'https://zaychin.sgp1.cdn.digitaloceanspaces.com/new/products/210/2bb886b1c67391c9ee222352f5fe1080-160.jpg?2021-07-12',
        subCategory: softDrink,
        category: beverageAndSnack);

    this.products = [
      chickenLeg,
      chickenMeat,
      porkBellySlice,
      porkEars,
      apple,
      banana,
      carrot,
      goldLabel,
      hibiki,
      glenfiddich,
      maxPlus,
      milo,
      nescafe
    ];
  }

  List<Category> getCategories() {
    return categories;
  }

  List<Product> getProducts() {
    return products;
  }

  List<Product> getAllProductsFromCategory(Category category) {
    return products
        .where((product) => product.category.name == category.name)
        .toList();
  }

  List<SubCategory> getSubCategory() {
    return subCateories;
  }

  List<SubCategory> getSubCategoriesFromCategory(Category category) {
    var subCategoriesToBeReturned = this
        .subCateories
        .where((subCategories) => subCategories.category == category)
        .toList();
    return subCategoriesToBeReturned;
  }

  List<Product> getProductsFromSubcategory(String subCategoryName) {
    var productsToBeReturned = this
        .products
        .where((product) => product.subCategory.name == subCategoryName)
        .toList();

    return productsToBeReturned;
  }
}
