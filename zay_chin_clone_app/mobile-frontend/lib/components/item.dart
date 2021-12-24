import 'package:clone_zay_chin/components/item_detail.dart';
import 'package:clone_zay_chin/data_models/store.dart';
import 'package:clone_zay_chin/data_models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class Item extends StatelessWidget {
  final Product product;

  Item({required this.product});

  Widget _buildAddToCart(StoreModel cartModel) {
    int chosenQty = cartModel.selectedProductCountInCart(product);
    if (chosenQty == 0) {
      return ElevatedButton(
          onPressed: () {
            cartModel.addProduct(product);
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xFFD9DFE2)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)))),
          child: Text(
            'Add to Cart',
            style: kAddToCartTextStyle,
          ));
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              cartModel.removeProduct(product);
            },
            icon: Icon(chosenQty == 1 ? Icons.delete : Icons.remove),
            iconSize: 15,
          ),
          Text('$chosenQty'),
          IconButton(
            onPressed: () {
              cartModel.addProduct(product);
            },
            icon: Icon(Icons.add),
            iconSize: 15,
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreModel>(builder: (context, cartModel, child) {
      return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // textBaseline: TextBaseline.alphabetic,

          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ItemDetail(
                              product: product,
                            )));
              },
              child: CircleAvatar(
                backgroundImage: Image.network(product.image).image,
                radius: 40.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              product.name,
              style: kLabelTextStyle,
              // maxLines: 2,
              // textDirection: TextDirection.ltr,
              // overflow: TextOverflow.ellipsis,
              // textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              product.price.toString() + ' Ks',
              style: kPriceTextStyle,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildAddToCart(cartModel),
            )
          ],
        ),
      );
    });
  }
}
