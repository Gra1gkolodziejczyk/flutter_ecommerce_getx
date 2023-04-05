import '../../../core/app_export.dart';
import '../controller/panier_screen_controller.dart';

class PanierScreenBinding extends Bindings {
   @override
  void dependencies() {
    Get.lazyPut(() => PanierScreenController());
  }
}