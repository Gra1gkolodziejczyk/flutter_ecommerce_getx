part of '../api_client.dart';

class UserRepository with CacheManager {
  Future<UserResponseModel?> login(UserRequestModel model) async {
    var response =
        await dio.post('${ApiClient.userUrl}/login', data: model.toJson());
    if (response.statusCode == 201) {
      return UserResponseModel.fromJson(response.data);
    } else {
      throw Exception('Error login');
    }
  }

  Future<UserResponseModel?> register(UserRequestModel model) async {
    var response =
        await dio.post('${ApiClient.userUrl}/register', data: model.toJson());
    if (response.statusCode == 201) {
      return UserResponseModel.fromJson(response.data);
    } else {
      throw Exception('Error register');
    }
  }

  Future<UserResponseModel?> getUser(UserRequestModel model) async {
    var response =
        await dio.get('${ApiClient.userUrl}/account', data: model.toJson());
    if (response.statusCode == 200) {
      return UserResponseModel.fromJson(response.data);
    } else {
      throw Exception('Error get user');
    }
  }

  /* Future<List<AddressResponseModel?>> getAdresse(
      AddressRequestModel model) async {
    var response = await dio.get('${ApiClient.addressUrl}/my-address',
        data: model.toJson());
    if (response.statusCode == 200) {
      List<AddressResponseModel> responce = (response.data as List)
          .map((e) => AddressResponseModel.fromJson(e))
          .toList();
      return responce;
    } else {
      throw Exception('Error get address');
    }
  } */
}
