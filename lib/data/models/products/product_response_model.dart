import 'package:json_annotation/json_annotation.dart';

part 'product_response_model.g.dart';

@JsonSerializable()
class ProductResponseModel {
  ProductResponseModel(
      {this.id,
      this.name,
      this.brand,
      this.description,
      this.category,
      this.image,
      this.price,
      this.reduction,
      this.size,
      this.stock});

  String? id;
  String? name;
  String? image;
  String? price;
  String? brand;
  String? description;
  int? stock;
  int? reduction;
  String? category;
  String? size;

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) => _$ProductResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductResponseModelToJson(this);

  ProductResponseModel.soloFromJson(Map json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        price = json['price'],
        brand = json['brand'],
        description = json['description'],
        stock = json['stock'],
        reduction = json['reduction'],
        category = json['category'],
        size = json['size'];
}
