// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressRequestModel _$AddressRequestModelFromJson(Map<String, dynamic> json) =>
    AddressRequestModel(
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

Map<String, dynamic> _$AddressRequestModelToJson(
        AddressRequestModel instance) =>
    <String, dynamic>{
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
