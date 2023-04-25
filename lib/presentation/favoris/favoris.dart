import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/navigation_drawer.dart';
import 'controller/favoris_screen_controller.dart';

class FavorisScreen extends GetWidget<FavorisScreenController> {
  const FavorisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      drawer: NavigationDrawerMenu(),
      body: SafeArea(
        child: Center(
          child: Text("Page Favoris"),
        ),
      ),
    );
  }
}
