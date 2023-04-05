// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panier_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PanierRequestModel _$PanierRequestModelFromJson(Map<String, dynamic> json) =>
    PanierRequestModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      firstname: json['firstname'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      confirmpassword: json['confirmpassword'] as String?,
    );

Map<String, dynamic> _$PanierRequestModelToJson(PanierRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'firstname': instance.firstname,
      'email': instance.email,
      'password': instance.password,
      'confirmpassword': instance.confirmpassword,
    };
