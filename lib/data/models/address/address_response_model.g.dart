// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressResponseModel _$AddressResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddressResponseModel(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      addressName: json['addressName'] as String?,
      civility: json['civility'] as String?,
      userName: json['userName'] as String?,
      userFirstName: json['userFirstName'] as String?,
      addressNumber: json['addressNumber'] as String?,
      address: json['address'] as String?,
      postalCode: json['postalCode'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      tel: json['tel'] as String?,
    );

Map<String, dynamic> _$AddressResponseModelToJson(
        AddressResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'addressName': instance.addressName,
      'civility': instance.civility,
      'userName': instance.userName,
      'userFirstName': instance.userFirstName,
      'addressNumber': instance.addressNumber,
      'address': instance.address,
      'postalCode': instance.postalCode,
      'city': instance.city,
      'country': instance.country,
      'tel': instance.tel,
    };
