// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'convert_panier_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConverPanierRequestModel _$ConverPanierRequestModelFromJson(
        Map<String, dynamic> json) =>
    ConverPanierRequestModel(
      products: json['products'] as List<ProductQuantityModel>?,
    );

Map<String, dynamic> _$ConverPanierRequestModelToJson(
        ConverPanierRequestModel instance) =>
    <String, dynamic>{
      'products': instance.products,
    };
