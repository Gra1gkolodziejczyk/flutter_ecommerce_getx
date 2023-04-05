import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/navigation_drawer.dart';
import 'controller/commandes_screen_controller.dart';

class CommandesScreen extends GetWidget<CommandesScreenController> {
  const CommandesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const NavigationDrawerMenu(),
      body: SafeArea(
        child: Text("Hello World"),
      ),
    );
  }
}
