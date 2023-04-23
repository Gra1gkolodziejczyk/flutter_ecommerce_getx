part of '../api_client.dart';

class PanierRepository with CacheManager {
  Future<PanierResponseModel?> addToCart(PanierRequestModel model) async {
    var response = await dio.post('${ApiClient.panierUrl}/add-to-cart',
        data: model.toJson());
    if (response.statusCode == 201) {
      return PanierResponseModel.fromJson(response.data);
    } else {
      throw Exception('Error add to cart');
    }
  }

  Future<PanierResponseModel?> convertToCart(
      ConverPanierRequestModel model) async {
    var response = await dio.post('${ApiClient.panierUrl}/convert-to-cart',
        data: model.toJson());
    if (response.statusCode == 201) {
      return PanierResponseModel.fromJson(response.data);
    } else {
      throw Exception('Error convert to cart');
    }
  }

  Future<PanierResponseModel?> removeToCart(PanierRequestModel model) async {
    var response = await dio.delete('${ApiClient.panierUrl}/remove-to-cart',
        data: model.toJson());
    if (response.statusCode == 200) {
      return PanierResponseModel.fromJson(response.data);
    } else {
      throw Exception('Error remove to cart');
    }
  }

  Future<PanierResponseModel?> getMyPanier() async {
    var response = await dio.get('${ApiClient.panierUrl}/my-cart');
    if (response.statusCode == 200) {
      return PanierResponseModel.fromJson(response.data);
    } else {
      throw Exception('Error get Panier');
    }
  }
}
