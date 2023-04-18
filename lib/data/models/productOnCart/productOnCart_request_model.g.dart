// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productOnCart_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductOnCartRequestModel _$ProductOnCartRequestModelFromJson(
        Map<String, dynamic> json) =>
    ProductOnCartRequestModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      price: json['price'] as String?,
      brand: json['brand'] as String?,
      description: json['description'] as String?,
      reduction: json['reduction'] as int?,
      category: json['category'] as String?,
      size: json['size'] as String?,
      quantity: json['quantity'] as int?,
    );

Map<String, dynamic> _$ProductOnCartRequestModelToJson(
        ProductOnCartRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
      'brand': instance.brand,
      'description': instance.description,
      'reduction': instance.reduction,
      'category': instance.category,
      'size': instance.size,
      'quantity': instance.quantity,
    };
