import '../../../core/app_export.dart';
import '../controller/profile_screen_controller.dart';

class ProfileScreenBinding extends Bindings {
   @override
  void dependencies() {
    Get.lazyPut(() => ProfileScreenController());
  }
}