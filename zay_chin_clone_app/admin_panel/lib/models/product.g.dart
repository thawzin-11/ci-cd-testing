// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['id'] as String?,
      json['name'] as String,
      json['description'] as String,
      json['priceUnit'] as String,
      json['price'] as int,
      json['image'] as String,
      json['qty'] as int,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'priceUnit': instance.priceUnit,
      'price': instance.price,
      'image': instance.image,
      'qty': instance.qty,
    };
