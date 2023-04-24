part of '../api_client.dart';

class CommandesRepository {
  Future<CheckoutResponseModel> startCheckout(
      CheckoutRequestModel model) async {
    var response =
        await dio.post('${ApiClient.commandesUrl}/start-checkout', data: model);
    if (response.statusCode == 201) {
      var resp = CheckoutResponseModel.fromJson(response.data);
      return resp;
    } else {
      throw Exception('Error create checkout');
    }
  }

  Future<List<CommandesResponse>> getMyOrders() async {
    var response = await dio.get('${ApiClient.commandesUrl}/my-orders');
    if (response.statusCode == 200) {
      List<CommandesResponse> orderList = (response.data as List)
          .map((e) => CommandesResponse.fromJson(e))
          .toList();
      return orderList;
    } else {
      throw Exception('Error get all orders');
    }
  }
}
