// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      json['houseOrApartmentNo'] as String,
      json['streetNo'] as String,
      json['quarter'] as String,
      json['township'] as String,
      json['city'] as String,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'houseOrApartmentNo': instance.houseOrApartmentNo,
      'streetNo': instance.streetNo,
      'quarter': instance.quarter,
      'township': instance.township,
      'city': instance.city,
    };
