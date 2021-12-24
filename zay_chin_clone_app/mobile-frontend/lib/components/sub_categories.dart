import 'package:clone_zay_chin/constants.dart';
import 'package:clone_zay_chin/data_models/product.dart';
import 'package:clone_zay_chin/components/item.dart';
import 'package:flutter/material.dart';
// import 'data_store.dart';

class SubCategoryPage extends StatefulWidget {
  final List<Product> products;

  SubCategoryPage(this.products);

  @override
  _SubCategoryPageState createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> allProducts = [];
    var products = widget.products;
    // print(products);

    products.forEach((product) {
      allProducts.add(Item(
        product: product,
      ));
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Zay Chin'),
      ),
      body: ListView(
        children: [
          Image.asset(
            // 'images/${receivedCategoryName.toLowerCase()}_meat.jpeg',
            'images/chicken_meat.jpeg',
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  'Chicken',
                  style: kSubCategoryTextStyle,
                ))
              ],
            ),
          ),
          Divider(
            thickness: 1.0,
          ),
          GridView.count(
            crossAxisCount: 3,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: allProducts,
          )
        ],
      ),
    );
  }
}
