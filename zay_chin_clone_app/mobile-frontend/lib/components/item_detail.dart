import 'dart:ui';

import 'package:clone_zay_chin/pages/cart_page.dart';
import 'package:clone_zay_chin/constants.dart';
import 'package:clone_zay_chin/data_models/store.dart';
import 'package:clone_zay_chin/data_models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({Key? key, required this.product}) : super(key: key);

  final Product product;

  Widget _buildAddToCart(StoreModel cartModel) {
    int countInCart = cartModel.selectedProductCountInCart(product);
    if (countInCart == 0) {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: Size(350, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: () {
            cartModel.addProduct(product);
          },
          child: Text('Add to cart'));
    } else {
      return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  cartModel.removeProduct(product);
                },
                icon: Icon(countInCart == 1 ? Icons.delete : Icons.remove),
                iconSize: 15,
              ),
              Text('$countInCart'),
              IconButton(
                onPressed: () {
                  cartModel.addProduct(product);
                },
                icon: Icon(Icons.add),
                iconSize: 15,
              )
            ],
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreModel>(builder: (context, cartModel, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text(product.name),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartPage()));
                  },
                  icon: Icon(Icons.shopping_cart)),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: Color(0xFFFFFFFF),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.network(
                          product.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                      // Image.network(productImage),
                      // Image.asset(
                      //   'images/apple.png',
                      //   scale: 2.0,
                      // ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              // 'Apple Fuji (Thai) 1pcs',
                              product.name,
                              style: kItemDetailTextStyle,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              // '1000 Ks',
                              product.price.toString(),
                              style: kPriceTextStyle,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Container(
                  color: Color(0xFFFFFFFF),
                  child: Row(
                    children: [Text('Related Products')],
                  ),
                ),
              ),
              _buildAddToCart(cartModel),
              SizedBox(
                height: 20,
              )
            ],
          ));
    });
  }
}
