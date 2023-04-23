import 'package:json_annotation/json_annotation.dart';

part 'checkout_request_model.g.dart';

@JsonSerializable()
class CheckoutRequestModel {
  CheckoutRequestModel({
    this.cartID,
    this.addressID,
  });

  String? cartID;
  String? addressID;

  factory CheckoutRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CheckoutRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$CheckoutRequestModelToJson(this);
}
