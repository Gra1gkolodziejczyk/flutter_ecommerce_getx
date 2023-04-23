import 'package:json_annotation/json_annotation.dart';

part 'checkout_response_model.g.dart';

@JsonSerializable()
class CheckoutResponseModel {
  CheckoutResponseModel({
    this.clientSecret,
  });

  String? clientSecret;

  factory CheckoutResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CheckoutResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CheckoutResponseModelToJson(this);
}
