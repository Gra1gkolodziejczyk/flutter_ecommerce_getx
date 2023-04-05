part of '../api_client.dart';

class CategoriesRepository {
  Future<List<CategoriesResponseModel>> getCategories(
      CategoriesRequestModel model) async {
    var response = await dio.get(ApiClient.categoriesUrl, data: model.toJson());
    if (response.statusCode == 200) {
      List<CategoriesResponseModel> responseList = (response.data as List)
          .map((e) => CategoriesResponseModel.fromJson(e))
          .toList();
      return responseList;
    } else {
      throw Exception('Error get products');
    }
  }
}
