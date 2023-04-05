import '../../../core/app_export.dart';
import '../controller/commandes_screen_controller.dart';

class CommandesScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommandesScreenController());
  }
}
