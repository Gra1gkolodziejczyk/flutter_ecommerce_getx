// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseModel _$UserResponseModelFromJson(Map<String, dynamic> json) =>
    UserResponseModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      firstname: json['firstname'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
      jwt: json['jwt'] as String?,
    );

Map<String, dynamic> _$UserResponseModelToJson(UserResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'firstname': instance.firstname,
      'email': instance.email,
      'role': instance.role,
      'jwt': instance.jwt,
    };
