import 'package:json_annotation/json_annotation.dart';

part 'panier_request_model.g.dart';

@JsonSerializable()
class PanierRequestModel {
  PanierRequestModel({
    this.id,
    this.userId,
    this.price,
    this.isPaid,
    this.createAt,
  });

  String? id;
  String? userId;
  String? price;
  String? isPaid;
  String? createAt;

  factory PanierRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PanierRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$PanierRequestModelToJson(this);
}
