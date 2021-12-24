// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['_id'] as String,
      json['name'] as String,
      json['description'] as String,
      json['priceUnit'] as String,
      json['price'] as int,
      json['image'] as String,
      json['category'] as String,
      json['subcategory'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'priceUnit': instance.priceUnit,
      'price': instance.price,
      'image': instance.image,
      'category': instance.category,
      'subcategory': instance.subcategory,
    };
