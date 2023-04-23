import 'package:e_commerce_front_getx/core/authentification/cache_manager.dart';
import 'package:e_commerce_front_getx/data/api_client/api_client.dart';
import 'package:e_commerce_front_getx/data/models/convertPanier/convert_panier_request_model.dart';
import 'package:e_commerce_front_getx/data/models/productOnCart/productOnCart_response_model.dart';
import 'package:e_commerce_front_getx/presentation/panier/model/panier_screen_model.dart';

import '../../../core/app_export.dart';
import '../../../data/models/panier/panier_request_model.dart';
import '../../../data/models/productQuantity/product_quantity_panier_request_model.dart';
import '../../../routes/app_routes.dart';

class PanierScreenController extends GetxController with CacheManager {
  final PanierRepository panierRepository = Get.find();

  RxList<ProductOnCartResponseModel> cartProduct =
      <ProductOnCartResponseModel>[].obs;

  Rx<PanierInfo?> panierInfo = PanierInfo().obs;
  RxBool isCompare = false.obs;
  RxBool checkAfterCheckout = false.obs;

  @override
  void onInit() {
    getAllMyCart();
    super.onInit();
  }

  String getPriceWithReduc(price, reduc) {
    var percent = double.parse(price) * reduc / 100;
    var newPrice = double.parse(price) - percent;
    return newPrice.toStringAsFixed(2);
  }

  getAllMyCart() async {
    var jwt = getJwt();
    if (jwt != null) {
      await convertCart();
    } else {
      getMyLocalPanier();
    }
  }

  lookOnlineCart() async {
    var jwt = getJwt();
    if (jwt != null) {
      var getLocalCart = await getPanier();
      var getonlineCart = await panierRepository.getMyPanier();
      if (!isCompare.value) {
        isCompare.value = true;
        if (compareLocalAndOnlineCart(
            getLocalCart.products, getonlineCart?.products)) {
        } else {
          await convertCart();
          getMyLocalPanier();
        }
      }
    } else {
      isCompare.value = false;
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
    if (info.price == '0' && !checkAfterCheckout.value) {
      cartProduct.value = getCart.products!;
      checkAfterCheckout.value = true;
    }
    panierInfo.value = info;
  }

  goToCheckout() async {
    var jwt = getJwt();
    if (jwt != null) {
      checkAfterCheckout.value = false;
      await Get.toNamed(AppRoutes.checkout);
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

  removeItemFromCart(product) async {
    var jwt = getJwt();
    if (jwt != null) {
      await removeOnlineCart(product);
      getMyLocalPanier();
    } else {
      await removeItem(product);
      getMyLocalPanier();
    }
  }

  removeOnlineCart(product) async {
    var response = await panierRepository
        .removeToCart(PanierRequestModel(productId: product.id));
    await addOnlineCart(response);
  }

  bool compareLocalAndOnlineCart(List<ProductOnCartResponseModel>? arr1,
      List<ProductOnCartResponseModel>? arr2) {
    if (arr1?.length != arr2?.length) {
      return false;
    }
    for (int index = 0; index < arr1!.length; index++) {
      if (!(arr2!.contains(arr1[index])) ||
          arr2[index].quantity != arr1[index].quantity) {
        return false;
      }
    }
    return true;
  }

  Future<int?> getCartLength() async {
    //la fonction sert a refresh le prix du panier a chaque fois
    getLocalCartInfo();
    lookOnlineCart();
    return cartProduct.length;
  }
}
