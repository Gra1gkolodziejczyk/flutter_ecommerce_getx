import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../routes/app_routes.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/navigation_drawer.dart';
import '../home/controller/home_screen_controller.dart';

class HomeScreen extends GetWidget<HomeScreenController> {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const NavigationDrawerMenu(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
               const Center(
                  child: Text('hello world'),
              ),
            ],
          ),
        ),
      );
  }
}