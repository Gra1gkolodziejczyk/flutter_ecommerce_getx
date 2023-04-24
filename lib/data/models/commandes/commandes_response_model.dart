import 'package:json_annotation/json_annotation.dart';

part 'commandes_response_model.g.dart';

@JsonSerializable()
class CommandesResponse {
  CommandesResponse(
      {this.id,
      this.userID,
      this.cartID,
      this.addressID,
      this.price,
      required this.date,
      this.status});

  String? id;
  String? userID;
  String? cartID;
  String? addressID;
  String? price;
  DateTime date;
  String? status;

  factory CommandesResponse.fromJson(Map<String, dynamic> json) =>
      _$CommandesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CommandesResponseToJson(this);
}
