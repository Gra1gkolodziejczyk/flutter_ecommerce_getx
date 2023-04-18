// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panier_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PanierResponseModel _$PanierResponseModelFromJson(Map<String, dynamic> json) =>
    PanierResponseModel(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      price: json['price'] as String?,
      isPaid: json['isPaid'] as String?,
      createAt: json['createAt'] as String?,
    );

Map<String, dynamic> _$PanierResponseModelToJson(
        PanierResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'price': instance.price,
      'isPaid': instance.isPaid,
      'createAt': instance.createAt,
    };
