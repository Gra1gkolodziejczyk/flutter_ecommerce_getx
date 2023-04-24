import 'package:e_commerce_front_getx/data/api_client/api_client.dart';

import '../../../core/app_export.dart';
import '../controller/commandes_screen_controller.dart';

class CommandesScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommandesScreenController());
    Get.lazyPut(() => CommandesRepository());
  }
}
