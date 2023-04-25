import 'package:e_commerce_front_getx/core/authentification/cache_manager.dart';
import 'package:e_commerce_front_getx/data/api_client/api_client.dart';
import 'package:e_commerce_front_getx/data/models/products/product_response_model.dart';

import '../../../core/app_export.dart';
import '../../../data/models/panier/panier_request_model.dart';
import '../../../data/models/productOnCart/productOnCart_response_model.dart';

class DetailsScreenController extends GetxController with CacheManager {
  PanierRepository panierRepository = Get.find();
  late String productID = Get.parameters['productID'] ?? "";
  final ProductRepository productsRepository = Get.find();
  late ProductResponseModel product;

  Rx<ProductResponseModel?> detailsModel = ProductResponseModel().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getProductById() async {
    productID = Get.parameters['productID'] ?? "";
    if (productID != "") {
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

  String getPriceWithReduc(price, reduc) {
    var percent = double.parse(price) * reduc / 100;
    var newPrice = double.parse(price) - percent;
    return newPrice.toStringAsFixed(2);
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
}
