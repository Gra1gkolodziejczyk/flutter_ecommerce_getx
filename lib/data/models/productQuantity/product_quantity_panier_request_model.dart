import 'package:json_annotation/json_annotation.dart';

part 'product_quantity_panier_request_model.g.dart';

@JsonSerializable()
class ProductQuantityModel {
  ProductQuantityModel({this.productId, this.productQuantity});

  String? productId;
  int? productQuantity;

  factory ProductQuantityModel.fromJson(Map<String, dynamic> json) =>
      _$ProductQuantityModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductQuantityModelToJson(this);
}
