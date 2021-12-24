import 'package:clone_zay_chin/data_models/product.dart';
import 'package:flutter/material.dart';

class StoreModel extends ChangeNotifier {
  final List<Product> products = [];
  String? _token = null;
  dynamic _user = null;

  num get totalPrice {
    num total = 0;
    products.forEach((product) {
      total += product.price;
    });
    return total;
  }

  void addToken(String? token) {
    _token = token;
    notifyListeners();
  }

  void addUser(dynamic user) {
    _user = user;
    notifyListeners();
  }

  dynamic get user {
    return _user;
  }

  String? get token {
    return _token;
  }

  void addProduct(Product product) {
    products.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    int index =
        products.indexWhere((productInList) => product.id == productInList.id);
    if (index != -1) {
      products.removeAt(index);
    }
    notifyListeners();
  }

  bool selectedProductOrNot() {
    if (products.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  List<CartItem> getCartItems() {
    List<CartItem> cartItems = [];

    //Search through cartItems for product.
    //If the product is found, increase it's count.
    //If not found, add new cartItem;
    products.forEach((product) {
      int foundIndex =
          cartItems.indexWhere((cartItem) => cartItem.product == product);

      if (foundIndex == -1) {
        cartItems.add(CartItem(product: product, count: 1));
      } else {
        cartItems[foundIndex].count++;
      }
    });

    return cartItems;
  }

  int selectedProductCountInCart(Product product) {
    //Check if the selected product is already in cart.
    //Return count of selected product.
    var foundProducts =
        products.where((eachProduct) => eachProduct.id == product.id);
    return foundProducts.length;
  }
}

class CartItem {
  CartItem({required this.product, this.count = 0});
  Product product;
  int count;
}
