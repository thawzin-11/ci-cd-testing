// import 'package:clone_zay_chin/data_store.dart';
import 'package:clone_zay_chin/data_models/product.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'item.dart';

class ItemRow extends StatelessWidget {
  final String categoryName;
  final List<Product> products;

  ItemRow({required this.categoryName, required this.products});

  @override
  Widget build(BuildContext context) {
    late Widget productRow;
    if (products.isNotEmpty) {
      productRow = Row(
        children: [
          Expanded(
              child: Container(
            color: Color(0xFFFFFFFF),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        categoryName,
                        style: kLabelTextStyle,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xFFD9DFE2)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      // side: BorderSide(color: Colors.red),
                                      borderRadius:
                                          BorderRadius.circular(18.0)))),
                          child: Text(
                            'View All',
                            style: kAddToCartTextStyle,
                          )),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,

                      children: products
                          .map((product) => Item(
                                product: product,
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      );
    } else {
      productRow = Container();
    }
    return productRow;
  }
}
