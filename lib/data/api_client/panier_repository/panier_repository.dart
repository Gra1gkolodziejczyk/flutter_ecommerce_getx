part of '../api_client.dart';

class PanierRepository {
  Future<List<PanierResponseModel>> getProduct(PanierRequestModel model) async {
    var response = await dio.get(ApiClient.productsUrl, data: model.toJson());
    if (response.statusCode == 200) {
      List<PanierResponseModel> responseList = (response.data as List)
          .map((e) => PanierResponseModel.fromJson(e))
          .toList();
      return responseList;
    } else {
      throw Exception('Error get products');
    }
  }
}
