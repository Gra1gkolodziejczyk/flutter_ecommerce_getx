import 'dart:convert';

import 'package:e_commerce_front_getx/data/models/panier/panier_response_model.dart';
import 'package:e_commerce_front_getx/data/models/productOnCart/productOnCart_response_model.dart';
import 'package:e_commerce_front_getx/presentation/panier/model/panier_screen_model.dart';

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
    print('create Cart');
    List<ProductOnCartResponseModel?> panierProducts = List.empty();
    PanierInfo panierInfo = PanierInfo(
        id: null, createAt: null, isPaid: false, price: "0", userId: null);
    var panierInfoJSON = jsonEncode(panierInfo.toJson());
    await storage.write('panierInfo', panierInfoJSON);
    await storage.write('panierProduct', panierProducts.toList());
    return true;
  }

  Future<bool> addLocalCart(ProductOnCartResponseModel? article) async {
    var panier = storage.read<List>('panierProduct');
    var infoJSON = storage.read('panierInfo');
    var info = PanierInfo.fromJson(json.decode(infoJSON));

    //add le prix au panier
    var percent = double.parse(article!.price!) * article.reduction! / 100;
    var newPrice = double.parse(article.price!) - percent;
    var textPrice = double.parse(info.price!) + newPrice;
    info.price = textPrice.toStringAsFixed(2);
    infoJSON = jsonEncode(info.toJson());
    await storage.write('panierInfo', infoJSON);

    bool alreadyexist = false;
    if (panier != null) {
      for (var i = 0; i < panier.length; i++) {
        if (panier[i].id == article.id) {
          panier[i].quantity++;
          alreadyexist = true;
        }
      }
      if (alreadyexist) {
        await storage.write('panierProduct', panier);
        return true;
      }
    }
    panier?.add(article);
    await storage.write('panierProduct', panier);
    return true;
  }

  addOnlineCart(PanierResponseModel? panier) async {
    var produits = storage.read<List>('panierProduct');
    var infoJSON = storage.read('panierInfo');

    //set Paniers Infos to storage
    var info = PanierInfo(
        id: panier?.id,
        userId: panier?.userId,
        createAt: panier?.createAt,
        isPaid: panier?.isPaid,
        price: panier?.price);
    infoJSON = jsonEncode(info.toJson());
    await storage.write('panierInfo', infoJSON);
    //set Panier Products to storage
    produits = panier?.products;
    await storage.write('panierProduct', produits);
    print('add online cart');
  }

  Future<PanierResponseModel> getPanier() async {
    var product = storage.read<List>('panierProduct');
    var infoJSON = await storage.read('panierInfo');
    if (infoJSON != null) {
      var info = PanierInfo.fromJson(json.decode(infoJSON));
      var panier = PanierResponseModel(
          id: info.id,
          createAt: info.createAt,
          isPaid: info.isPaid,
          price: info.price,
          userId: info.userId,
          products: product?.cast<ProductOnCartResponseModel>());
      return panier;
    }

    return PanierResponseModel();
  }

  int? getLength() {
    var resp = storage.read<List>('panierProduct');
    return resp?.length;
  }

  removeItem(ProductOnCartResponseModel? article) async {
    var panier = storage.read<List>('panierProduct');
    var infoJSON = storage.read('panierInfo');
    var info = PanierInfo.fromJson(json.decode(infoJSON));

    //changement du prix du panier
    var percent = double.parse(article!.price!) * article.reduction! / 100;
    var newPrice = double.parse(article.price!) - percent;
    var textPrice = double.parse(info.price!) - newPrice;
    textPrice < 0 ? textPrice = 0 : textPrice = textPrice;
    info.price = textPrice.toStringAsFixed(2);
    infoJSON = jsonEncode(info.toJson());
    await storage.write('panierInfo', infoJSON);

    bool more1quantity = false;
    for (var i = 0; i < panier!.length; i++) {
      if (panier[i].id == article.id && panier[i].quantity > 1) {
        panier[i].quantity--;
        more1quantity = true;
      }
    }
    if (more1quantity) {
      await storage.write('panierProduct', panier);
      return true;
    } else {
      panier.remove(article);
      await storage.write('panierProduct', panier);
      return true;
    }
  }

  Future<void> removePanier() async {
    await storage.remove('panierProduct');
    await storage.remove('panierInfo');
  }
}

enum CacheManagerKey { jwt }
