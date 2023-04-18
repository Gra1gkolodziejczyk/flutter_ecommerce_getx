import 'package:json_annotation/json_annotation.dart';

part 'productOnCart_response_model.g.dart';

@JsonSerializable()
class ProductOnCartResponseModel {
  ProductOnCartResponseModel({
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

  factory ProductOnCartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductOnCartResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductOnCartResponseModelToJson(this);
}
