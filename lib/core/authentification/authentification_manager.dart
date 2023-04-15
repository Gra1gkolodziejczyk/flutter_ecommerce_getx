import 'package:e_commerce_front_getx/core/app_export.dart';
import 'package:e_commerce_front_getx/core/authentification/cache_manager.dart';
import 'package:e_commerce_front_getx/routes/app_routes.dart';

class AuthentificationManager extends GetxController with CacheManager {
  var isLogged = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void logOut() async {
    isLogged.value = false;
    await removeJwt();
    await Get.toNamed(AppRoutes.initialRoute);
  }

  void login(String? jwt) async {
    isLogged.value = true;
    print(saveJwt(jwt));
    await saveJwt(jwt);
    await Get.toNamed(AppRoutes.profile);
  }

  void register(String? jwt) async {
    isLogged.value = true;
    print(saveJwt(jwt));
    await saveJwt(jwt);
    await Get.toNamed(AppRoutes.profile);
  }
}
