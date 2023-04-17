import '../../routes/app_routes.dart';
import '../app_export.dart';

mixin CacheManager {
  final storage = GetStorage();

  Future<bool> saveJwt(String? jwt) async {
    await storage.write('jwt', jwt);
    return true;
  }

  String? getJwt() {
    final jwt = storage.read('jwt');
    return jwt;
  }

  Future<void> removeJwt() async {
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
