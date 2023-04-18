import 'package:json_annotation/json_annotation.dart';

part 'categories_request_model.g.dart';

@JsonSerializable()
class CategoriesRequestModel {
  CategoriesRequestModel({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory CategoriesRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesRequestModelToJson(this);
}
