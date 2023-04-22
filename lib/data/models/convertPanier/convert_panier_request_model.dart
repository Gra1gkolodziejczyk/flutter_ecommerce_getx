import 'package:json_annotation/json_annotation.dart';

import '../productQuantity/product_quantity_panier_request_model.dart';

part 'convert_panier_request_model.g.dart';

@JsonSerializable()
class ConverPanierRequestModel {
  ConverPanierRequestModel({
    this.products,
  });
  List<ProductQuantityModel>? products;

  factory ConverPanierRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ConverPanierRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$ConverPanierRequestModelToJson(this);
}
