import 'package:e_commerce_front_getx/data/models/productOnCart/productOnCart_response_model.dart';

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

  Future<bool> createPanier() async {
    List<ProductOnCartResponseModel?> panier = List.empty();
    await storage.write('panier', panier.toList());
    return true;
  }

  Future<bool> addPanier(ProductOnCartResponseModel? article) async {
    var panier = storage.read<List>('panier');
    panier?.add(article);
    await storage.write('panier', panier);
    return true;
  }

  List? getPanier() {
    var resp = storage.read<List>('panier');
    return resp;
  }

  int? getLength() {
    var resp = storage.read<List>('panier');
    return resp?.length;
  }

  Future<void> removePanier() async {
    await storage.remove('panier');
  }
}

enum CacheManagerKey { jwt }
