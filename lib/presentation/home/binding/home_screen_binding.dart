import 'package:e_commerce_front_getx/data/api_client/api_client.dart';
import '../../../core/app_export.dart';
import '../controller/home_screen_controller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => ProductRepository());
    Get.lazyPut(() => CategoriesRepository());
    Get.lazyPut(() => PanierRepository());
  }
}
