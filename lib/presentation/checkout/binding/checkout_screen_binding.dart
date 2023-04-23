import 'package:e_commerce_front_getx/data/api_client/api_client.dart';

import '../../../core/app_export.dart';
import '../controller/checkout_screen_controller.dart';

class CheckoutScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckoutScreenController());
    Get.lazyPut(() => CommandesRepository());
    Get.lazyPut(() => AddressRepository());
  }
}
