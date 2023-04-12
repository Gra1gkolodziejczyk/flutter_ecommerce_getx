import 'package:e_commerce_front_getx/presentation/home/home.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../routes/app_routes.dart';
import 'controller/profile_screen_controller.dart';

class ProfileScreen extends GetWidget<ProfileScreenController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text("Hello World"),
            ),
            Center(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text(
                  "Profil",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  Get.toNamed(AppRoutes.profile);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
