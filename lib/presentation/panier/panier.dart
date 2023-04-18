import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/navigation_drawer.dart';
import 'controller/panier_screen_controller.dart';

class PanierScreen extends GetWidget<PanierScreenController> {
  PanierScreen({Key? key}) : super(key: key);

  final PanierScreenController panierController = Get.find<PanierScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const NavigationDrawerMenu(),
      body: SafeArea(
        child: Stack(children: [
          Obx(
            () => ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: CartCard(panierController: panierController, index: index),
              ),
              itemCount: panierController.panier.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.height * 0.07,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 37, 143, 11),
                          borderRadius: BorderRadius.circular(35),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 4),
                                color: const Color.fromARGB(255, 32, 109, 12).withOpacity(0.15),
                                spreadRadius: 4,
                                blurRadius: 50)
                          ]),
                      child: const Center(
                        child: Text(
                          "Payer",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.panierController,
    required this.index,
  });

  final PanierScreenController panierController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.80,
        height: MediaQuery.of(context).size.height * 0.12,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 201, 205, 216),
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  color: const Color.fromARGB(255, 201, 205, 216).withOpacity(0.15),
                  spreadRadius: 4,
                  blurRadius: 50)
            ]),
        child: Row(
          children: [
            Image.network(
              '${panierController.panier[index].image}',
              width: 60,
              height: 75,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              child: Text(panierController.panier[index].name!),
            ),
            IconButton(
              onPressed: () {
                panierController.panier.removeAt(index);

                Get.snackbar('Supprimé', "Cet article a été retiré de votre panier",
                    snackPosition: SnackPosition.BOTTOM);
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
