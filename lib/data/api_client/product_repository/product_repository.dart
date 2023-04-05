part of '../api_client.dart';

class ProductRepository {
  Future<List<ProductResponseModel>> getProduct(
      ProductRequestModel model) async {
    var response = await dio.get(ApiClient.productsUrl, data: model.toJson());
    if (response.statusCode == 200) {
      List<ProductResponseModel> responseList = (response.data as List)
          .map((e) => ProductResponseModel.fromJson(e))
          .toList();
      return responseList;
    } else {
      throw Exception('Error get products');
    }
  }
}
