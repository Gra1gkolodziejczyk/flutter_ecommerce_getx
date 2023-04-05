import 'package:dio/dio.dart';
import '../../core/app_export.dart';

final dio = Dio(BaseOptions(
  baseUrl: dotenv.get('CLIENT_URL'),
  headers: {
    "Accept": "application/json",
  },
  contentType: "application/json",
));

class ApiClient {
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