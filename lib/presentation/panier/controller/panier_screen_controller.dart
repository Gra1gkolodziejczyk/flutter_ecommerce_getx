import 'package:e_commerce_front_getx/core/authentification/cache_manager.dart';
import 'package:e_commerce_front_getx/data/api_client/api_client.dart';
import 'package:e_commerce_front_getx/data/models/convertPanier/convert_panier_request_model.dart';
import 'package:e_commerce_front_getx/data/models/productOnCart/productOnCart_response_model.dart';
import 'package:e_commerce_front_getx/presentation/panier/model/panier_screen_model.dart';

import '../../../core/app_export.dart';
import '../../../data/models/productQuantity/product_quantity_panier_request_model.dart';
import '../../../routes/app_routes.dart';

class PanierScreenController extends GetxController with CacheManager {
  final PanierRepository panierRepository = Get.find();

  RxList<ProductOnCartResponseModel> cartProduct =
      <ProductOnCartResponseModel>[].obs;

  Rx<PanierInfo?> panierInfo = PanierInfo().obs;

  @override
  void onInit() {
    getAllMyCart();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String getPriceWithReduc(price, reduc) {
    var percent = double.parse(price) * reduc / 100;
    var newPrice = double.parse(price) - percent;
    return newPrice.toStringAsFixed(2);
  }

  getAllMyCart() async {
    var getCart = await getPanier();
    var jwt = getJwt();
    if (jwt != null && getCart.products!.isEmpty) {
      print('online');
      await getMyOnlineCart();
    } else {
      print('local');
      getMyLocalPanier();
    }
  }

  lookOnlineCart() async {
    var jwt = getJwt();
    if (jwt != null) {
      var getLocalCart = await getPanier();
      var getonlineCart = await panierRepository.getMyPanier();
      if (getLocalCart.price == getonlineCart?.price) {
        print('sameCart');
      } else {
        await convertCart();
        getMyLocalPanier();
      }
    }
  }

  void getMyLocalPanier() async {
    var getCart = await getPanier();
    var info = PanierInfo(
        id: getCart.id,
        createAt: getCart.createAt,
        isPaid: getCart.isPaid,
        price: getCart.price,
        userId: getCart.userId);
    panierInfo.value = info;
    cartProduct.value = getCart.products!;
  }

  getLocalCartInfo() async {
    var getCart = await getPanier();
    var info = PanierInfo(
        id: getCart.id,
        createAt: getCart.createAt,
        isPaid: getCart.isPaid,
        price: getCart.price,
        userId: getCart.userId);
    panierInfo.value = info;
  }

  getMyOnlineCart() async {
    var response = await panierRepository.getMyPanier();
    await addOnlineCart(response);
    getMyLocalPanier();
  }

  goToCheckout() async {
    var jwt = getJwt();
    if (jwt != null) {
      print("go to checkout");
    } else {
      await Get.toNamed(AppRoutes.login);
    }
  }

  convertCart() async {
    var list = <ProductQuantityModel>[];
    for (var cartProd in cartProduct) {
      list.add(ProductQuantityModel(
          productId: cartProd.id, productQuantity: cartProd.quantity));
    }
    var arg = ConverPanierRequestModel(products: list.toList());
    var response = await panierRepository.convertToCart(arg);
    await addOnlineCart(response);
  }

  Future<int?> getCartLength() async {
    //la fonction sert a refresh le prix du panier a chaque fois
    getLocalCartInfo();
    lookOnlineCart();
    return cartProduct.length;
  }
}
