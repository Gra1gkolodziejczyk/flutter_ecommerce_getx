import 'package:get_storage/get_storage.dart';

import '../../routes/app_routes.dart';
import '../app_export.dart';

mixin CacheManager {
  final storage = GetStorage();

  Future<bool> saveJwt(String? jwt) async {
    print(jwt);
    await storage.write('jwt', jwt);
    return true;
  }

  String? getJwt() {
    return storage.read('jwt');
  }

  Future<void> removeJwt() async {
    print(removeJwt());
    await storage.remove('jwt');
  }

  void checkLoginStatus() {
    if (getJwt() == null) {
      Get.toNamed(AppRoutes.login);
    } else {
      Get.toNamed(AppRoutes.profile);
    }
  }
}

enum CacheManagerKey { jwt }
