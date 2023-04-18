import 'package:e_commerce_front_getx/data/api_client/api_client.dart';

import '../../../core/app_export.dart';
import '../../register/controller/register_screen_controller.dart';
import '../controller/login_screen_controller.dart';

class LoginScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenController());
    Get.lazyPut(() => RegisterScreenController());
    Get.lazyPut(() => UserRepository());
  }
}
