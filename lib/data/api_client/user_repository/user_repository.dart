part of '../api_client.dart';

class UserRepository {
  Future<UserResponseModel?> login(UserRequestModel model) async {
    var response =
        await dio.post('${ApiClient.userUrl}/login', data: model.toJson());
    if (response.statusCode == 201) {
      print(response.data);
      return UserResponseModel.fromJson(response.data);
    } else {
      throw Exception('Error login');
    }
  }

  Future<UserResponseModel?> register(UserRequestModel model) async {
    var response =
        await dio.post('${ApiClient.userUrl}/register', data: model.toJson());
    if (response.statusCode == 201) {
      print(response.data);
      return UserResponseModel.fromJson(response.data);
    } else {
      throw Exception('Error register');
    }
  }

  Future<UserResponseModel?> getUser(UserRequestModel model) async {
    var response =
        await dio.get('${ApiClient.userUrl}/account', data: model.toJson());
    if (response.statusCode == 200) {
      print(response.data);
      return UserResponseModel.fromJson(response.data);
    } else {
      throw Exception('Error get user');
    }
  }
}
