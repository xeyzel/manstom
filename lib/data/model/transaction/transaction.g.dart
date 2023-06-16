// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Transaction _$$_TransactionFromJson(Map<String, dynamic> json) =>
    _$_Transaction(
      id: json['id'] as String? ?? "",
      productName: json['productName'] as String? ?? "",
      warehouseName: json['warehouseName'] as String? ?? "",
      infoPrice: json['infoPrice'] as String? ?? "",
      infoQuantity: json['infoQuantity'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      idTransaction: json['idTransaction'] as String? ?? "",
      userId: json['userId'] as String? ?? "",
    );

Map<String, dynamic> _$$_TransactionToJson(_$_Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productName': instance.productName,
      'warehouseName': instance.warehouseName,
      'infoPrice': instance.infoPrice,
      'infoQuantity': instance.infoQuantity,
      'createdAt': instance.createdAt,
      'idTransaction': instance.idTransaction,
      'userId': instance.userId,
    };
