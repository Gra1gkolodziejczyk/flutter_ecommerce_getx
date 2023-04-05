import '../../../core/app_export.dart';
import '../controller/reset_password_screen_controller.dart';

class ResetPasswordScreenBinding extends Bindings {
   @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordScreenController());
  }
}