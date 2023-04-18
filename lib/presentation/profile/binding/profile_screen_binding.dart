import 'package:e_commerce_front_getx/data/api_client/api_client.dart';

import '../../../core/app_export.dart';
import '../controller/profile_screen_controller.dart';

class ProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileScreenController());
    Get.lazyPut(() => UserRepository());
    Get.lazyPut(() => AddressRepository());
  }
}
