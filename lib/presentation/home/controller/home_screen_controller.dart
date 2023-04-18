import 'dart:ffi';

import 'package:e_commerce_front_getx/core/authentification/cache_manager.dart';
import '../../../core/app_export.dart';
import '../../../core/authentification/authentification_manager.dart';
import '../../../data/api_client/api_client.dart';
import '../../../data/models/categories/categories_request_model.dart';
import '../../../data/models/products/product_request_model.dart';
import '../model/home_screen_model.dart';

class HomeScreenController extends GetxController with CacheManager {
  final ProductRepository productsRepository = Get.find();
  final AuthentificationManager authentificationManager = Get.find();
  final CategoriesRepository categoriesRepository = Get.find();
  RxList<CategoriesWithProductModel> categoriesWithProduct =
      <CategoriesWithProductModel>[].obs;
  final price = String;
  final reduc = Int;

  @override
  void onInit() {
    super.onInit();
    getCategoriesWithProducts();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getCategoriesWithProducts() async {
    var categoriesResponse =
        await categoriesRepository.getCategories(CategoriesRequestModel());
    var respList = <CategoriesWithProductModel>[];
    for (var i = 0; i < categoriesResponse.length; i++) {
      var products = await productsRepository.getProduct(
          ProductRequestModel(), categoriesResponse[i].id!);
      respList.add(CategoriesWithProductModel(
          id: categoriesResponse[i].id,
          name: categoriesResponse[i].name,
          products: products));
    }
    categoriesWithProduct.value = respList;
  }

  String getPriceWithReduc(price, reduc) {
    var percent = double.parse(price) * reduc / 100;
    var newPrice = double.parse(price) - percent;
    return newPrice.toStringAsFixed(2);
  }

  void logOut() async {
    authentificationManager.logOut();
  }
}
