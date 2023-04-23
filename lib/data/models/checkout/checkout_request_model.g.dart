// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutRequestModel _$CheckoutRequestModelFromJson(
        Map<String, dynamic> json) =>
    CheckoutRequestModel(
      cartID: json['cartID'] as String?,
      addressID: json['addressID'] as String?,
    );

Map<String, dynamic> _$CheckoutRequestModelToJson(
        CheckoutRequestModel instance) =>
    <String, dynamic>{
      'cartID': instance.cartID,
      'addressID': instance.addressID,
    };
