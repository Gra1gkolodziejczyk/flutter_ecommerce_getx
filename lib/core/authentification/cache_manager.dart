import '../app_export.dart';

mixin CacheManager {
  final storage = GetStorage();

  Future<bool> saveJwt(String? jwt) async {
    await storage.write('jwt', jwt);
    return true;
  }

  String? getJwt() {
    return storage.read('jwt');
  }

  Future<void> removeJwt() async {
    await storage.remove('jwt');
  }
}

enum CacheManagerKey { jwt }
