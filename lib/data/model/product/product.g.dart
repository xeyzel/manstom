// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      quantity: json['quantity'] as int? ?? 0,
      createdAt: json['createdAt'] as String? ?? '',
      warehouseId: json['warehouseId'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      warehouseName: json['warehouseName'] as String? ?? '',
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'price': instance.price,
      'quantity': instance.quantity,
      'createdAt': instance.createdAt,
      'warehouseId': instance.warehouseId,
      'userId': instance.userId,
      'warehouseName': instance.warehouseName,
    };
