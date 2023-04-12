import 'package:json_annotation/json_annotation.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class UserResponseModel {
  UserResponseModel({
    this.id,
    this.name,
    this.firstname,
    this.email,
    this.password,
    this.confirmpassword,
  });

  String? id;
  String? name;
  String? firstname;
  String? email;
  String? password;
  String? confirmpassword;

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);
}
