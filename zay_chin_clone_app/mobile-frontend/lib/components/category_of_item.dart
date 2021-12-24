import 'package:clone_zay_chin/pages/cart_page.dart';
import 'package:clone_zay_chin/components/item.dart';
import 'package:clone_zay_chin/constants.dart';
import 'package:clone_zay_chin/data_models/product.dart';
import 'package:flutter/material.dart';

class CategoryOfItem extends StatelessWidget {
  const CategoryOfItem({Key? key, required this.productLists})
      : super(key: key);
  final List<Product> productLists;

  @override
  Widget build(BuildContext context) {
    List<Item> listOfItems =
        productLists.map((product) => Item(product: product)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Zay Wal'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
                print('shopping cart button');
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: ListView(
        children: [
          Image.asset(
            'images/chicken_meat.jpeg',
            fit: BoxFit.fitWidth,
            height: 150,
          ),
          Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              children: [
                Text(
                  productLists[0].subcategory,
                  style: kSubCategoryTextStyle,
                )
              ],
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: 0.62,
              children: listOfItems,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.category), label: 'Categories'),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu')
      ]),
    );
  }
}
