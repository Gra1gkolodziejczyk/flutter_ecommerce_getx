import 'package:dio/dio.dart';
import 'package:e_commerce_front_getx/data/models/products/product_request_model.dart';
import 'package:e_commerce_front_getx/data/models/products/product_response_model.dart';
import 'package:e_commerce_front_getx/data/models/categories/categories_request_model.dart';
import 'package:e_commerce_front_getx/data/models/categories/categories_response_model.dart';
import '../../core/app_export.dart';

part './product_repository/product_repository.dart';
part './categories_repository/categories_repository.dart';

final dio = Dio(BaseOptions(
  baseUrl: dotenv.get('URL_API'),
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
