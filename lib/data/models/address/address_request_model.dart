import 'package:json_annotation/json_annotation.dart';

part 'address_request_model.g.dart';

@JsonSerializable()
class AddressRequestModel {
  AddressRequestModel({
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

  factory AddressRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddressRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressRequestModelToJson(this);
}
