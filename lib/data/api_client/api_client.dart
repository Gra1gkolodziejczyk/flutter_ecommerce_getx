import 'package:dio/dio.dart';
import 'package:e_commerce_front_getx/data/models/commandes/commandes_response_model.dart';
import 'package:e_commerce_front_getx/data/models/convertPanier/convert_panier_request_model.dart';
import 'package:e_commerce_front_getx/data/models/panier/panier_request_model.dart';
import 'package:e_commerce_front_getx/data/models/panier/panier_response_model.dart';
import 'package:e_commerce_front_getx/data/models/products/product_request_model.dart';
import 'package:e_commerce_front_getx/data/models/products/product_response_model.dart';
import 'package:e_commerce_front_getx/data/models/categories/categories_request_model.dart';
import 'package:e_commerce_front_getx/data/models/categories/categories_response_model.dart';
import 'package:e_commerce_front_getx/data/models/user/user_request_model.dart';
import 'package:e_commerce_front_getx/data/models/user/user_response_model.dart';
import 'package:e_commerce_front_getx/data/models/address/address_request_model.dart';
import 'package:e_commerce_front_getx/data/models/address/address_response_model.dart';
import 'package:e_commerce_front_getx/routes/app_routes.dart';
import '../../core/app_export.dart';
import '../../core/authentification/cache_manager.dart';
import '../models/checkout/checkout_request_model.dart';
import '../models/checkout/checkout_response_model.dart';

part './product_repository/product_repository.dart';
part './categories_repository/categories_repository.dart';
part './user_repository/user_repository.dart';
part './adresse_repository/adresse_repository.dart';
part './panier_repository/panier_repository.dart';
part './commandes_repository/commandes_repository.dart';

final storage = GetStorage();

final dio = Dio(
  BaseOptions(
    baseUrl: dotenv.get('URL_API'),
    headers: {
      "Accept": "application/json",
    },
    contentType: "application/json",
  ),
);

class ApiClient with CacheManager {
  ApiClient() {
    initDioClient();
  }

  void initDioClient() {
    //permet de suivre les redirection du back
    dio.options.followRedirects = true;

    dio.interceptors.clear();

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (storage.hasData("jwt")) {
            var token = getJwt();
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            Get.toNamed(AppRoutes.login);
          }
          return handler.next(error);
        },
      ),
    );
  }

  // routes Api
  // products
  static const String productsUrl = '/products';

  // categories
  static const String categoriesUrl = '/categories';

  // users
  static const String userUrl = '/users';

  // panier
  static const String panierUrl = '/carts';

  // favorites
  static const String favorisUrl = '/favoris';

  //adresse
  static const String addressUrl = '/address';

  //commande
  static const String commandesUrl = '/orders';
}
