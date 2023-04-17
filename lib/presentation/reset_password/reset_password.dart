import 'package:e_commerce_front_getx/widgets/custom_appbar.dart';
import 'package:e_commerce_front_getx/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'controller/reset_password_screen_controller.dart';

class ResetPasswordScreen extends GetWidget<ResetPasswordScreenController> {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const NavigationDrawerMenu(),
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
