part of '../api_client.dart';

class CategorieRepository {
  Future<List<CategorieResponseModel>> getProduct(
      CategorieRequestModel model) async {
    var response = await dio.get(ApiClient.productsUrl, data: model.toJson());
    if (response.statusCode == 200) {
      List<CategorieResponseModel> responseList = (response.data as List)
          .map((e) => CategorieResponseModel.fromJson(e))
          .toList();
      return responseList;
    } else {
      throw Exception('Error get products');
    }
  }
}
