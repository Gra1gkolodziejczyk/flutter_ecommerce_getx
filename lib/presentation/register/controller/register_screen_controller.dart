import 'package:e_commerce_front_getx/core/authentification/authentification_manager.dart';
import 'package:e_commerce_front_getx/core/authentification/cache_manager.dart';
import 'package:e_commerce_front_getx/data/api_client/api_client.dart';
import 'package:e_commerce_front_getx/data/models/user/user_request_model.dart';
import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class RegisterScreenController extends GetxController with CacheManager {
  final UserRepository userRepository = Get.find();
  final AuthentificationManager authentificationManager = Get.find();
  TextEditingController name = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();

  void onInit() {
    super.onInit();
  }

  void onClose() {
    super.onClose();
  }

  void register() async {
    final response = await userRepository.register(
      UserRequestModel(
        name: name.text,
        firstname: firstname.text,
        email: email.text,
        password: password.text,
        confirmpassword: confirmpassword.text,
      ),
    );
    if (response != null) {
      authentificationManager.register(response.jwt);
    } else {
      throw Exception('Error jwt');
    }
  }

  String? validateFirstname(String? formFirstname) {
    if (formFirstname == null || formFirstname.isEmpty)
      return "le prénom doit être renseigné";
    return null;
  }

  String? validateName(String? formName) {
    if (formName == null || formName.isEmpty)
      return "le nom doit être renseigné";
    return null;
  }

  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty)
      return "L'email doit être renseigné";
    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formEmail))
      return "Le format de l'email ne convient pas.";
    return null;
  }

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty)
      return "le mot de passe doit être renseigné";
    String pattern = r'^.{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formPassword))
      return 'Le mot de passe doit contenir minimum 8 charactères.';
    return null;
  }

  String? validateConfirmpassword(String? formConfirmpassword) {
    if (formConfirmpassword == null || formConfirmpassword.isEmpty)
      return "le mot de passe doit être renseigné";
    String pattern = r'^.{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formConfirmpassword))
      return 'Le mot de passe doit contenir minimum 8 charactères.';
    return null;
  }
}
