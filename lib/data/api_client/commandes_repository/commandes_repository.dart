part of '../api_client.dart';

class CommandesRepository {
  Future<CheckoutResponseModel> startCheckout(
      CheckoutRequestModel model) async {
    var response =
        await dio.post('${ApiClient.commandesUrl}/start-checkout', data: model);
    if (response.statusCode == 201) {
      var resp = CheckoutResponseModel.fromJson(response.data);
      print(resp.clientSecret);
      return resp;
    } else {
      throw Exception('Error get categories');
    }
  }
}
