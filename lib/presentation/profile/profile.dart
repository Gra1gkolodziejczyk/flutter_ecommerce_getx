import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'controller/profile_screen_controller.dart';

class ProfileScreen extends GetWidget<ProfileScreenController> {
  const ProfileScreen({ Key? key }) : super(key: key);

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