import 'package:e_commerce_front_getx/core/authentification/authentification_manager.dart';
import 'package:flutter/material.dart';

import '../app_export.dart';

class AuthentificationMiddleware extends GetMiddleware {
  final authController = Get.put(AuthentificationManager());
  @override
  RouteSettings? redirect(String? route) {
    return authController.isLogged.value == true || route == '/login'
        ? null
        : const RouteSettings(name: '/login');
  }
}
