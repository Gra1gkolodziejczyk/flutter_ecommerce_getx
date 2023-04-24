part of '../api_client.dart';

class AddressRepository {
  Future<List<AddressResponseModel>> getMyAddress() async {
    var response = await dio.get('${ApiClient.addressUrl}/my-address');
    if (response.statusCode == 200) {
      List<AddressResponseModel> adresseList = (response.data as List)
          .map((e) => AddressResponseModel.fromJson(e))
          .toList();
      return adresseList;
    } else {
      throw Exception('Error get categories');
    }
  }

  Future<AddressResponseModel> createAddress(AddressRequestModel model) async {
    var response = await dio.post('${ApiClient.addressUrl}/new-address',
        data: model.toJson());
    if (response.statusCode == 201) {
      return AddressResponseModel.fromJson(response.data);
    } else {
      throw Exception('Error create address');
    }
  }

  Future<AddressResponseModel> getOneAddress(String? id) async {
    var response = await dio.get('${ApiClient.addressUrl}/my-address/$id');
    if (response.statusCode == 200) {
      return AddressResponseModel.fromJson(response.data);
    } else {
      throw Exception('Error get categories');
    }
  }

  Future<AddressResponseModel> removeOneAddress(String? id) async {
    var response = await dio.post('${ApiClient.addressUrl}/remove-address/$id');
    if (response.statusCode == 200) {
      return AddressResponseModel.fromJson(response.data);
    } else {
      throw Exception('Error get categories');
    }
  }

  Future<List<AddressResponseModel>> getAdress() async {
    var response = await dio.get('${ApiClient.addressUrl}/my-address');
    if (response.statusCode == 200) {
      List<AddressResponseModel> responce = (response.data as List)
          .map((e) => AddressResponseModel.fromJson(e))
          .toList();
      return responce;
    } else {
      throw Exception('Error get address');
    }
  }
}
