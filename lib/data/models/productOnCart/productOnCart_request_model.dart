import 'package:json_annotation/json_annotation.dart';

part 'productOnCart_request_model.g.dart';

@JsonSerializable()
class ProductOnCartRequestModel {
  ProductOnCartRequestModel({
    this.id,
    this.name,
    this.image,
    this.price,
    this.brand,
    this.description,
    this.reduction,
    this.category,
    this.size,
    this.quantity,
  });

  String? id;
  String? name;
  String? image;
  String? price;
  String? brand;
  String? description;
  int? reduction;
  String? category;
  String? size;
  int? quantity;

  factory ProductOnCartRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ProductOnCartRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductOnCartRequestModelToJson(this);
}
