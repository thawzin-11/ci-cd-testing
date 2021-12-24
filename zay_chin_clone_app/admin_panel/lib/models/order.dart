import 'package:admin_panel/models/product.dart';
import 'package:admin_panel/models/address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  // String id;
  String status;
  String customerName;
  String deliveryPhNumber;
  Address address;
  String deliveryDate;
  String paymentMethod;
  var promoCode;
  var note;
  List<Product> products;

  Order(
    // this.id,
    this.status,
    this.customerName,
    this.deliveryPhNumber,
    this.address,
    this.deliveryDate,
    this.paymentMethod,
    this.promoCode,
    this.note,
    this.products,
  );

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
