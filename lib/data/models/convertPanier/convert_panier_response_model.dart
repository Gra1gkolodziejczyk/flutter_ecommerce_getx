import 'package:json_annotation/json_annotation.dart';
import '../productOnCart/productOnCart_response_model.dart';

part 'convert_panier_response_model.g.dart';

@JsonSerializable()
class ConvertPanierResponseModel {
  ConvertPanierResponseModel({
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

  factory ConvertPanierResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ConvertPanierResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ConvertPanierResponseModelToJson(this);
}
