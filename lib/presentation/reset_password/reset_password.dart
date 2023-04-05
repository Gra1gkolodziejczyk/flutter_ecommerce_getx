import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'controller/reset_password_screen_controller.dart';

class ResetPasswordScreen extends GetWidget<ResetPasswordScreenController> {
  const ResetPasswordScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(
              child: Text("Hello World"),
            ),
          ],
        ),
      ),
    );
  }
}