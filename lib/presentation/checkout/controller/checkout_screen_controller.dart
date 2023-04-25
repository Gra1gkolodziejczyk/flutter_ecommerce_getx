import 'package:e_commerce_front_getx/core/app_export.dart';
import 'package:e_commerce_front_getx/data/api_client/api_client.dart';
import 'package:e_commerce_front_getx/data/models/address/address_response_model.dart';
import 'package:e_commerce_front_getx/data/models/checkout/checkout_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../core/authentification/cache_manager.dart';
import '../../../routes/app_routes.dart';

class CheckoutScreenController extends GetxController with CacheManager {
  final CommandesRepository commandesRepository = Get.find();
  final AddressRepository _addressRepository = Get.find();
  RxList<AddressResponseModel> addressList = <AddressResponseModel>[].obs;
  RxString cartId = ''.obs;
  RxString addressId = ''.obs;

  @override
  void onInit() {
    getInfo();
    super.onInit();
  }

  getInfo() async {
    var getCart = await getPanier();
    cartId.value = getCart.id!;
    var address = await _addressRepository.getMyAddress();
    addressList.value = address;
  }

  getAddress() async {
    var address = await _addressRepository.getMyAddress();
    addressList.value = address;
  }

  startCheckout() async {
    var response = await commandesRepository.startCheckout(CheckoutRequestModel(
        cartID: cartId.value, addressID: addressList[0].id));
    await initialisePayment(response.clientSecret);
  }

  initialisePayment(String? clientSecret) async {
    await Stripe.instance
        .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          style: ThemeMode.light,
          merchantDisplayName: 'ShopTaBoard',
        ))
        .then((value) => {});
    await Stripe.instance
        .presentPaymentSheet(
            options: const PaymentSheetPresentOptions(
                timeout: 300000)) //5min pour payer
        .then((value) => {successCheckout()})
        .catchError((value) => {errorCheckout()});
  }

  errorCheckout() async {
    //faire en sorte que si timeout -> pas incomplé sur le dash
    await Get.toNamed(AppRoutes.panier);
  }

  successCheckout() async {
    await createPanier();
    await Get.toNamed(AppRoutes.initialRoute);
    //aller page home
  }

  selectAddress(address) async {
    addressId.value = address;
    getAddressLenght();
    print(addressId);
  }

  Future<int?> getAddressLenght() async {
    //faire en sorte que ca appel 1 fois si il y a 0 adresse
    if (addressList.isEmpty) {
      await getInfo();
    }
    if (addressId.value == '') {
    } else {
      print('pas daddress select');
    }
    return addressList.length;
  }
}
