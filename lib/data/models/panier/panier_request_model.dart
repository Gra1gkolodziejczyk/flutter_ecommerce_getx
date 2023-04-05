import 'package:json_annotation/json_annotation.dart';

part 'panier_request_model.g.dart';

@JsonSerializable()
class PanierRequestModel {
  PanierRequestModel({
    this.id,
    this.name,
    this.firstname,
    this.email,
    this.password,
    this.confirmpassword,
  });

  String? id;
  String? name;
  String? firstname;
  String? email;
  String? password;
  String? confirmpassword;

/*   factory PanierRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PanierRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$PanierRequestModelToJson(this); */
}
