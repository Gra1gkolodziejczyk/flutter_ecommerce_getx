import '../../../core/app_export.dart';
import '../../../data/api_client/api_client.dart';
import '../../../data/models/categories/categories_request_model.dart';
import '../../../data/models/categories/categories_response_model.dart';
import '../../../data/models/products/product_request_model.dart';
import '../../../data/models/products/product_response_model.dart';

class HomeScreenController extends GetxController {
  final ProductRepository _productsRepository = Get.find();
  final CategoriesRepository _categoriesRepository = Get.find();
  RxList<ProductResponseModel> productsList = <ProductResponseModel>[].obs;
  RxList<CategoriesResponseModel> categoriesList =
      <CategoriesResponseModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCategoriesAndProducts();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getProductsForCategory(String? id) async {
    var productsResponse =
        await _productsRepository.getProduct(ProductRequestModel(), id!);

    if (productsResponse.isNotEmpty) {
      productsList.value = productsResponse;
      print(productsResponse);
    }
  }

  void getCategoriesAndProducts() async {
    var categoriesResponse =
        await _categoriesRepository.getCategories(CategoriesRequestModel());

    if (categoriesResponse.isNotEmpty) {
      categoriesList.value = categoriesResponse;
      print(categoriesList.value);
      for (var i = 0; i < categoriesList.length; i++) {
        if (categoriesList[i].name == 'deck') {
          getProductsForCategory(categoriesList[i].id);
        }
      }
    }
  }
}
