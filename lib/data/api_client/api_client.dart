import 'package:dio/dio.dart';
import 'package:e_commerce_front_getx/data/models/products/product_request_model.dart';
import 'package:e_commerce_front_getx/data/models/products/product_response_model.dart';
import 'package:e_commerce_front_getx/data/models/categories/categories_request_model.dart';
import 'package:e_commerce_front_getx/data/models/categories/categories_response_model.dart';
import 'package:e_commerce_front_getx/data/models/user/user_request_model.dart';
import 'package:e_commerce_front_getx/data/models/user/user_response_model.dart';
import 'package:e_commerce_front_getx/routes/app_routes.dart';
import '../../core/app_export.dart';
import '../../core/authentification/cache_manager.dart';

part './product_repository/product_repository.dart';
part './categories_repository/categories_repository.dart';
part './user_repository/user_repository.dart';

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
    dio.interceptors.clear();

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (await storage.hasData("jwt")) {
            var token = await getJwt();
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
  static const String panierUrl = 'carts';

  // favorites
  static const String favorisUrl = '/favoris';
}
