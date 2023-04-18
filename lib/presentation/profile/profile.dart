import 'package:flutter/material.dart';
import '../../core/app_export.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/navigation_drawer.dart';
import 'controller/profile_screen_controller.dart';

class ProfileScreen extends GetWidget<ProfileScreenController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const NavigationDrawerMenu(),
      backgroundColor: const Color.fromARGB(255, 255, 253, 247),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => SizedBox(
                height: MediaQuery.of(context).size.height - 149,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text('firstname :'),
                        Text(' ${controller.userModel.value?.firstname}'),
                      ],
                    ),
                    Row(
                      children: [
                        Text('name :'),
                        Text(' ${controller.userModel.value?.name}'),
                      ],
                    ),
                    Row(
                      children: [
                        Text('email :'),
                        Text(' ${controller.userModel.value?.email}'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
