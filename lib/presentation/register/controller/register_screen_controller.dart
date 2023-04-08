import 'package:e_commerce_front_getx/data/api_client/api_client.dart';
import 'package:e_commerce_front_getx/data/models/user/user_request_model.dart';
import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class RegisterScreenController extends GetxController {
  final UserRepository _userRepository = Get.find();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onInit() {
    super.onInit();
    register();
  }

  void onClose() {
    super.onClose();
  }

  void register() {
    _userRepository.register(
      UserRequestModel(
        name: name.text,
        firstname: firstname.text,
        email: email.text,
        password: password.text,
        confirmpassword: confirmpassword.text,
      ),
    );
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
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~?]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formPassword))
      return '''
        Le mot de passe doit contenir minimum 8 charactères,
        doit inclure une majuscule, un nombre et un symbol.
        ''';
    return null;
  }

  String? validateConfirmpassword(String? formConfirmpassword) {
    if (formConfirmpassword == null || formConfirmpassword.isEmpty)
      return "le mot de passe doit être renseigné";
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~?]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formConfirmpassword))
      return '''
        Le mot de passe doit contenir minimum 8 charactères,
        doit inclure une majuscule, un nombre et un symbol.
        ''';
    return null;
  }
}
