import 'package:e_commerce_front_getx/core/app_export.dart';
import 'package:e_commerce_front_getx/core/authentification/authentification_manager.dart';
import 'package:e_commerce_front_getx/data/api_client/api_client.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiClient());
    Get.put(AuthentificationManager());
  }
}
