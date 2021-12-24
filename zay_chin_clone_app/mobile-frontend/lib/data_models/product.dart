import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String description;
  final String priceUnit;
  final int price;
  final String image;
  final String category;
  final String subcategory;

  Product(this.id, this.name, this.description, this.priceUnit, this.price,
      this.image, this.category, this.subcategory);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  bool operator ==(Object other) => other is Product && other.id == id;
}

String jsonString = """{
  "name": "Maung Maung",
  "email": "maung@mail.com",
  "phone": 21313123,
  "address": "no 1 bla bla bla"
}""";

Map<String, dynamic> jsonMap = jsonDecode(jsonString);

var aa = Product.fromJson(jsonMap);
