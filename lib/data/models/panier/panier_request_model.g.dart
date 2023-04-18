// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panier_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PanierRequestModel _$PanierRequestModelFromJson(Map<String, dynamic> json) =>
    PanierRequestModel(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      price: json['price'] as String?,
      isPaid: json['isPaid'] as String?,
      createAt: json['createAt'] as String?,
    );

Map<String, dynamic> _$PanierRequestModelToJson(PanierRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'price': instance.price,
      'isPaid': instance.isPaid,
      'createAt': instance.createAt,
    };
