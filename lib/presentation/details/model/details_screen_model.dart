import 'package:e_commerce_front_getx/data/models/address/address_response_model.dart';

class DetailsModel {
  DetailsModel({
    this.id,
    this.email,
    this.role,
    this.name,
    this.firstname,
    this.address,
  });

  String? id;
  String? email;
  String? role;
  String? name;
  String? firstname;
  List<AddressResponseModel>? address;
}
