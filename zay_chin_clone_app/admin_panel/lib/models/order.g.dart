// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      json['status'] as String,
      json['customerName'] as String,
      json['deliveryPhNumber'] as String,
      Address.fromJson(json['address'] as Map<String, dynamic>),
      json['deliveryDate'] as String,
      json['paymentMethod'] as String,
      json['promoCode'],
      json['note'],
      (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'status': instance.status,
      'customerName': instance.customerName,
      'deliveryPhNumber': instance.deliveryPhNumber,
      'address': instance.address,
      'deliveryDate': instance.deliveryDate,
      'paymentMethod': instance.paymentMethod,
      'promoCode': instance.promoCode,
      'note': instance.note,
      'products': instance.products,
    };
