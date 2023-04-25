import 'package:e_commerce_front_getx/data/api_client/api_client.dart';

import '../../../core/app_export.dart';
import '../controller/details_screen_controller.dart';

class DetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsScreenController());

    Get.lazyPut(() => UserRepository());
    Get.lazyPut(() => AddressRepository());
    Get.lazyPut(() => PanierRepository());
  }
}
