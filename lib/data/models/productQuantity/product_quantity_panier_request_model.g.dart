// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_quantity_panier_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductQuantityModel _$ProductQuantityModelFromJson(
        Map<String, dynamic> json) =>
    ProductQuantityModel(
      productId: json['productId'] as String?,
      productQuantity: json['productQuantity'] as int?,
    );

Map<String, dynamic> _$ProductQuantityModelToJson(
        ProductQuantityModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productQuantity': instance.productQuantity,
    };
