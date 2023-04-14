import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 255, 253, 247),
      iconTheme: const IconThemeData(color: Color.fromARGB(255, 89, 56, 56)),
      elevation: 0,
      toolbarHeight: 50,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
