part of '../api_client.dart';

class UserRepository {
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
}
