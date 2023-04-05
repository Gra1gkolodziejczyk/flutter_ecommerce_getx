import '../../../core/app_export.dart';
import '../controller/register_screen_controller.dart';

class RegisterScreenBinding extends Bindings {
   @override
  void dependencies() {
    Get.lazyPut(() => RegisterScreenController());
  }
}