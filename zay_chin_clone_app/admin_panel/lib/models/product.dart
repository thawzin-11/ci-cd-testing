import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  String? id;
  String name;
  String description;
  String priceUnit;
  int price;
  String image;
  int qty;

  Product(
    this.id,
    this.name,
    this.description,
    this.priceUnit,
    this.price,
    this.image,
    this.qty,
  );

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
