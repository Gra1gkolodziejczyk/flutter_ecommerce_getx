import 'package:json_annotation/json_annotation.dart';

part 'panier_response_model.g.dart';

@JsonSerializable()
class PanierResponseModel {
  PanierResponseModel({
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

  factory PanierResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PanierResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$PanierResponseModelToJson(this);
}
