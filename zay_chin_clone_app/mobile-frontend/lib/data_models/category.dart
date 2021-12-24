import 'package:clone_zay_chin/data_models/product.dart';
import 'package:json_annotation/json_annotation.dart';

// import 'product.dart';

part 'category.g.dart';

@JsonSerializable(explicitToJson: true)
class Category {
  final String name;
  final List<Product> products;

  Category(this.name, this.products);

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
