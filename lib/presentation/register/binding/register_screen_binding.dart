import 'package:e_commerce_front_getx/data/api_client/api_client.dart';

import '../../../core/app_export.dart';
import '../controller/register_screen_controller.dart';

class RegisterScreenBinding extends Bindings {
   @override
  void dependencies() {
    Get.lazyPut(() => RegisterScreenController());
    Get.lazyPut(() => UserRepository());
  }
}