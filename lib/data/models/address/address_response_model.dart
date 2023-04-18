import 'package:json_annotation/json_annotation.dart';

part 'address_response_model.g.dart';

@JsonSerializable()
class AddressResponseModel {
  AddressResponseModel({
    this.id,
    this.userId,
    this.addressName,
    this.civility,
    this.userName,
    this.userFirstName,
    this.addressNumber,
    this.address,
    this.postalCode,
    this.city,
    this.country,
    this.tel,
  });

  String? id;
  String? userId;
  String? addressName;
  String? civility;
  String? userName;
  String? userFirstName;
  String? addressNumber;
  String? address;
  String? postalCode;
  String? city;
  String? country;
  String? tel;

  factory AddressResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressResponseModelToJson(this);
}
