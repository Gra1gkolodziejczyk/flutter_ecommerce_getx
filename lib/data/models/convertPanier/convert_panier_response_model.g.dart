// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'convert_panier_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConvertPanierResponseModel _$ConvertPanierResponseModelFromJson(
        Map<String, dynamic> json) =>
    ConvertPanierResponseModel(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      price: json['price'] as String?,
      isPaid: json['isPaid'] as bool?,
      createAt: json['createAt'] == null
          ? null
          : DateTime.parse(json['createAt'] as String),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) =>
              ProductOnCartResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConvertPanierResponseModelToJson(
        ConvertPanierResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'price': instance.price,
      'isPaid': instance.isPaid,
      'createAt': instance.createAt?.toIso8601String(),
      'products': instance.products,
    };
