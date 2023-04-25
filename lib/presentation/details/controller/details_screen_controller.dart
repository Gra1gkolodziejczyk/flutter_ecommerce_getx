import 'package:e_commerce_front_getx/data/api_client/api_client.dart';
import 'package:e_commerce_front_getx/data/models/products/product_response_model.dart';

import '../../../core/app_export.dart';

class DetailsScreenController extends GetxController {
  final String productID = "";
  final ProductRepository productsRepository = Get.find();
  late ProductResponseModel product;

  Rx<ProductResponseModel?> detailsModel = ProductResponseModel().obs;

  @override
  void onInit() {
    super.onInit();
  }

  void getProductById() async {
    var parameters = Get.parameters;
    if (parameters['productId'] != "") {
      product = await productsRepository.getProductById(productID);
    }
    detailsModel.value = ProductResponseModel(
      id: product.id,
      name: product.name,
      brand: product.brand,
      description: product.description,
      category: product.category,
      image: product.image,
      price: product.price,
      reduction: product.reduction,
      size: product.size,
      stock: product.stock,
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
