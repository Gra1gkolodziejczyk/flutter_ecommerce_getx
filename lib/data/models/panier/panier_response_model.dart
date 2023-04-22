import 'package:e_commerce_front_getx/data/models/productOnCart/productOnCart_response_model.dart';
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
    this.products,
  });

  String? id;
  String? userId;
  String? price;
  bool? isPaid;
  DateTime? createAt;
  List<ProductOnCartResponseModel>? products;

  factory PanierResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PanierResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$PanierResponseModelToJson(this);
}
