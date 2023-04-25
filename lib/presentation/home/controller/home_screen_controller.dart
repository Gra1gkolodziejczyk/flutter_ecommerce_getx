import 'dart:ffi';

import 'package:e_commerce_front_getx/core/authentification/cache_manager.dart';
import 'package:e_commerce_front_getx/data/models/panier/panier_request_model.dart';
import 'package:e_commerce_front_getx/data/models/productOnCart/productOnCart_response_model.dart';
import 'package:e_commerce_front_getx/data/models/products/product_response_model.dart';
import 'package:e_commerce_front_getx/routes/app_routes.dart';
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
  final PanierRepository panierRepository = Get.find();

  RxList<CategoriesWithProductModel> categoriesWithProduct = <CategoriesWithProductModel>[].obs;
  final price = String;
  final reduc = Int;
  final product = ProductResponseModel();

  @override
  void onInit() {
    super.onInit();
    createPanier();
    getCategoriesWithProducts();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getCategoriesWithProducts() async {
    var categoriesResponse = await categoriesRepository.getCategories(CategoriesRequestModel());
    var respList = <CategoriesWithProductModel>[];
    for (var i = 0; i < categoriesResponse.length; i++) {
      var products = await productsRepository.getProduct(ProductRequestModel(), categoriesResponse[i].id!);
      respList.add(CategoriesWithProductModel(
          id: categoriesResponse[i].id, name: categoriesResponse[i].name, products: products));
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

  addToCart(product) async {
    var jwt = getJwt();
    if (jwt == null) {
      await addToLocalCart(product);
    } else {
      await addToOnlineCart(product);
    }
    print(getLength());
  }

  addToOnlineCart(product) async {
    await panierRepository.addToCart(PanierRequestModel(productId: product.id));
    await addToLocalCart(product);
  }

  addToLocalCart(product) async {
    var productOnCart = ProductOnCartResponseModel(
      id: product.id,
      brand: product.brand,
      description: product.description,
      category: product.category,
      image: product.image,
      name: product.name,
      price: product.price,
      reduction: product.reduction,
      size: product.size,
      quantity: 1,
    );
    await addLocalCart(productOnCart);
  }

  goToDetails(String? productId) async {
    await Get.toNamed(AppRoutes.details, parameters: {'productID': productId ?? ""});
  }
}
// arguments: {
//  'movie_id': 10,
// }