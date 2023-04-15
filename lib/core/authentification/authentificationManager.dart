import 'package:e_commerce_front_getx/core/app_export.dart';
import 'package:e_commerce_front_getx/core/authentification/cacheManager.dart';
import 'package:e_commerce_front_getx/data/api_client/api_client.dart';
import 'package:e_commerce_front_getx/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../../data/models/user/user_request_model.dart';

class AuthentificationManager extends GetxController with CacheManager {
  var isLogged = false.obs;
  final UserRepository _userRepository = Get.find();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  void logOut() async {
    isLogged.value = false;
    removeJwt();
    Get.toNamed(AppRoutes.initialRoute);
  }

  void login(String? jwt) async {
    isLogged.value = true;
    await _userRepository
        .login(UserRequestModel(email: email.text, password: password.text));
    await saveJwt(jwt);
    await Get.toNamed(AppRoutes.profile);
  }

  void register(String? jwt) async {
    isLogged.value = true;
    await _userRepository.register(
      UserRequestModel(
        name: name.text,
        firstname: firstname.text,
        email: email.text,
        password: password.text,
        confirmpassword: confirmpassword.text,
      ),
    );
    await saveJwt(jwt);
    Get.toNamed(AppRoutes.profile);
  }
}
