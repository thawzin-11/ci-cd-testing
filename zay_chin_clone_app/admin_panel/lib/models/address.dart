import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  String houseOrApartmentNo;
  String streetNo;
  String quarter;
  String township;
  String city;

  Address(
    this.houseOrApartmentNo,
    this.streetNo,
    this.quarter,
    this.township,
    this.city,
  );

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
