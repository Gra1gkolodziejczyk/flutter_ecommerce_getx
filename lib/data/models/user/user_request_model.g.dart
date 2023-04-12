// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequestModel _$UserRequestModelFromJson(Map<String, dynamic> json) =>
    UserRequestModel(
      name: json['name'] as String?,
      firstname: json['firstname'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      confirmpassword: json['confirmpassword'] as String?,
    );

Map<String, dynamic> _$UserRequestModelToJson(UserRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'firstname': instance.firstname,
      'email': instance.email,
      'password': instance.password,
      'confirmpassword': instance.confirmpassword,
    };
