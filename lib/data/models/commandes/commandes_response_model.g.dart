// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commandes_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommandesResponse _$CommandesResponseFromJson(Map<String, dynamic> json) =>
    CommandesResponse(
      id: json['id'] as String?,
      userID: json['userID'] as String?,
      cartID: json['cartID'] as String?,
      addressID: json['addressID'] as String?,
      price: json['price'] as String?,
      date: DateTime.parse(json['date'] as String),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CommandesResponseToJson(CommandesResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userID': instance.userID,
      'cartID': instance.cartID,
      'addressID': instance.addressID,
      'price': instance.price,
      'date': instance.date.toIso8601String(),
      'status': instance.status,
    };
