import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ProductRequestModel {
  ProductRequestModel({
    this.id,
    this.name,
    this.brand,
    this.description,
    this.category,
    this.image,
    this.price,
    this.reduction,
    this.size,
    this.stock
  });

  String? id;
  String? name;
  String? image;
  String? price;
  String? brand;
  String? description;
  String? stock;
  String? reduction;
  String? category;
  String? size;
}