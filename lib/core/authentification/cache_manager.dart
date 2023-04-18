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

  Future<bool> savePanier(String? panier) async {
    await storage.write('panier', panier);
    return true;
  }

  String? getPanier() {
    return storage.read('panier');
  }

  Future<void> removePanier() async {
    await storage.remove('panier');
  }
}

enum CacheManagerKey { jwt }
