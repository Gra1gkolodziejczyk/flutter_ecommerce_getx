import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../presentation/home/controller/home_screen_controller.dart';

class NavigationDrawerMenu extends GetWidget<HomeScreenController> {
  const NavigationDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.only(top:100, right: 16, left: 16),
    child: Wrap(
      runSpacing: 11,
      children: [
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text("Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.shopping_basket),
          title: const Text("Mon panier",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.favorite),
          title: const Text("Mes favories",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onTap: () {},
        ),
        const SizedBox(height: 100),
        MaterialButton(
          onPressed: () {},
          color: Colors.blue,
          minWidth: MediaQuery.of(context).size.width,
          child: const Text("Se déconnecté", 
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}