import 'package:e_commerce_front_getx/core/authentification/cache_manager.dart';
import 'package:e_commerce_front_getx/data/api_client/api_client.dart';
import 'package:e_commerce_front_getx/data/models/panier/panier_request_model.dart';

import '../../../core/app_export.dart';

class PanierScreenController extends GetxController with CacheManager {
  final PanierRepository panierRepository = Get.find();

  @override
  void onInit() {
    super.onInit();
    getMyFuckingPanier();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getMyFuckingPanier() async {
    await panierRepository.getMyPanier(PanierRequestModel());
  }
}
