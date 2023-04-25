import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/navigation_drawer.dart';
import 'controller/panier_screen_controller.dart';

class PanierScreen extends GetWidget<PanierScreenController> {
  const PanierScreen({Key? key}) : super(key: key);

  final TextStyle text = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 89, 56, 56));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const NavigationDrawerMenu(),
      backgroundColor: const Color.fromARGB(255, 255, 253, 247),
      body: SafeArea(
        child: Obx(
          () => SizedBox(
              height: MediaQuery.of(context).size.height - 149,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder<int?>(
                future: controller.getCartLength(),
                builder: (BuildContext context, AsyncSnapshot<int?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Prix du Panier: ${controller.panierInfo.value?.price} €',
                          style: text,
                        ),
                        snapshot.data != 0
                            ? ElevatedButton(
                                onPressed: () {
                                  controller.goToCheckout();
                                },
                                child: Text(
                                  "Aller au checkout",
                                  style: text,
                                ),
                              )
                            : ElevatedButton(
                                onPressed: null,
                                child: Text(
                                  "Aller au checkout",
                                  style: text,
                                ),
                              ),
                        Expanded(
                            child: ListView.builder(
                          itemCount: snapshot.data ?? 0,
                          itemBuilder: (context, index) {
                            return controller.cartProduct[index].reduction != 0
                                ? Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Image.network(
                                            '${controller.cartProduct[index].image}',
                                            width: 100,
                                            height: 100,
                                          ),
                                          Positioned(
                                            top: 20,
                                            left: 0,
                                            child: Container(
                                              color: Colors.red,
                                              child: Text(
                                                '${controller.cartProduct[index].reduction}%',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                100,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  '${controller.cartProduct[index].price}€  ',
                                                  style: const TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    decorationColor:
                                                        Color.fromARGB(
                                                            255, 89, 56, 56),
                                                    decorationThickness: 1.8,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 89, 56, 56),
                                                  ),
                                                ),
                                                Text(
                                                  '${controller.getPriceWithReduc(controller.cartProduct[index].price, controller.cartProduct[index].reduction)} €',
                                                  style: text,
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'x${controller.cartProduct[index].quantity}',
                                              style: text,
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                Icons.delete,
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                controller.removeItemFromCart(
                                                    controller
                                                        .cartProduct[index]);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Image.network(
                                        '${controller.cartProduct[index].image}',
                                        width: 100,
                                        height: 100,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                100,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${controller.getPriceWithReduc(controller.cartProduct[index].price, controller.cartProduct[index].reduction)} €',
                                              style: text,
                                            ),
                                            Text(
                                              'x${controller.cartProduct[index].quantity}',
                                              style: text,
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                Icons.delete,
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                controller.removeItemFromCart(
                                                    controller
                                                        .cartProduct[index]);
                                                //controller.removePanier();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                          },
                        )),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )),
        ),
      ),
    );
  }
}
