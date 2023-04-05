import '../../../core/app_export.dart';
import '../controller/favoris_screen_controller.dart';

class FavorisScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavorisScreenController());
  }
}
