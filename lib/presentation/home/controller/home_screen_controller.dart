import '../../../core/app_export.dart';
import '../../../data/api_client/api_client.dart';
import '../../../data/models/products/product_request_model.dart';
import '../../../data/models/products/product_response_model.dart';

class HomeScreenController extends GetxController {
  final ProductRepository _productsRepository = Get.find();
  RxList<ProductResponseModel> productsList = <ProductResponseModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getProduct() async {
    var response = await _productsRepository.getProduct(ProductRequestModel());
    print(response);

    if (response.isNotEmpty) {
      productsList.value = response;
    }
  }
}
