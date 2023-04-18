import 'package:json_annotation/json_annotation.dart';

part 'categories_response_model.g.dart';

@JsonSerializable()
class CategoriesResponseModel {
  CategoriesResponseModel({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesResponseModelToJson(this);
}
