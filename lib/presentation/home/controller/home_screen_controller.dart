import 'package:e_commerce_front_getx/core/authentification/cache_manager.dart';
import 'package:e_commerce_front_getx/routes/app_routes.dart';
import '../../../core/app_export.dart';
import '../../../data/api_client/api_client.dart';
import '../../../data/models/categories/categories_request_model.dart';
import '../../../data/models/products/product_request_model.dart';
import '../model/home_screen_model.dart';

class HomeScreenController extends GetxController with CacheManager {
  var isLogged = false.obs;
  final ProductRepository productsRepository = Get.find();
  final CategoriesRepository categoriesRepository = Get.find();
  // RxList<ProductResponseModel> productsList = <ProductResponseModel>[].obs;
  // RxList<CategoriesResponseModel> categoriesList =
  //     <CategoriesResponseModel>[].obs;
  RxList<CategoriesWithProductModel> categoriesWithProduct =
      <CategoriesWithProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // getCategoriesAndProducts();
    getCategoriesWithProducts();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // void getProductsForCategory(String? id) async {
  //   var productsResponse =
  //       await productsRepository.getProduct(ProductRequestModel(), id!);

  //   if (productsResponse.isNotEmpty) {
  //     productsList.value = productsResponse;
  //   }
  // }

  // void getCategoriesAndProducts() async {
  //   var categoriesResponse =
  //       await categoriesRepository.getCategories(CategoriesRequestModel());

  //   if (categoriesResponse.isNotEmpty) {
  //     categoriesList.value = categoriesResponse;
  //     for (var i = 0; i < categoriesList.length; i++) {
  //       if (categoriesList[i].name == 'deck') {
  //         getProductsForCategory(categoriesList[i].id);
  //       } else if (categoriesList[i].name == 'truck') {
  //         getProductsForCategory(categoriesList[i].id);
  //       } else {
  //         getProductsForCategory(categoriesList[i].id);
  //       }
  //     }
  //   }
  // }

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

  void logOut() async {
    isLogged.value = false;
    await removeJwt();
    await Get.offNamed(AppRoutes.initialRoute);
  }
}
