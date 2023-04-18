import 'package:e_commerce_front_getx/data/models/products/product_response_model.dart';

import '../../../core/app_export.dart';

class PanierScreenController extends GetxController {
  var panier = List<ProductResponseModel>.empty().obs;

  @override
  void onInit() {
    List? storedTodos = GetStorage().read<List>('panier');
    if (storedTodos != null) {
      panier = storedTodos.map((e) => ProductResponseModel.fromJson(e)).toList().obs;
    }
    ever(panier, (_) {
      GetStorage().write('panier', panier.toList());
    });
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
