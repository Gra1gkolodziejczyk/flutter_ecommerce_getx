import 'package:json_annotation/json_annotation.dart';

part 'user_request_model.g.dart';

@JsonSerializable()
class UserRequestModel {
  UserRequestModel({
    this.name,
    this.firstname,
    this.email,
    this.password,
    this.confirmpassword,
  });

  String? name;
  String? firstname;
  String? email;
  String? password;
  String? confirmpassword;

  factory UserRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserRequestModelToJson(this);
}
