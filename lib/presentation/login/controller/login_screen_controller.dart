import 'package:e_commerce_front_getx/data/api_client/api_client.dart';
import 'package:e_commerce_front_getx/data/models/user/user_request_model.dart';
import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class LoginScreenController extends GetxController {
  final UserRepository _userRepository = Get.find();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    login();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void login() {
    _userRepository
        .login(UserRequestModel(email: email.text, password: password.text));
  }

  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty)
      return "l'email doit être renseigné";

    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formEmail))
      return "Le format de l'email ne convient pas.";
    return null;
  }

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty)
      return "Le mot de passe doit être renseigné";

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~?]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formPassword)) {
      return '''
        Le mot de passe doit contenir minimum 8 charactères,
        doit inclure une majuscule, un nombre et un symbol.
        ''';
    }
    return null;
  }
}
