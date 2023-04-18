import 'package:e_commerce_front_getx/data/api_client/api_client.dart';

import '../../../core/app_export.dart';
import '../controller/panier_screen_controller.dart';

class PanierScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PanierScreenController());
    Get.lazyPut(() => PanierRepository());
  }
}
