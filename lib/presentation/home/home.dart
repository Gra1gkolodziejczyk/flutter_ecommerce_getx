import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/navigation_drawer.dart';
import '../home/controller/home_screen_controller.dart';
import '../../widgets/Capitalize.dart';

class HomeScreen extends GetWidget<HomeScreenController> {
  HomeScreen({Key? key}) : super(key: key);

  final ButtonStyle bg = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 251, 209, 72),
  );

  final TextStyle title =
      const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 89, 56, 56));

  final TextStyle text =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 89, 56, 56));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const NavigationDrawerMenu(),
      backgroundColor: const Color.fromARGB(255, 255, 253, 247),
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => SizedBox(
                height: MediaQuery.of(context).size.height - 149,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.categoriesWithProduct.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text(
                          '${controller.categoriesWithProduct[index].name?.toCapitalized()}',
                          style: title,
                        ),
                        Column(
                          children: [
                            Obx(
                              () => SizedBox(
                                height: 500,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.categoriesWithProduct[index].products?.length,
                                  itemBuilder: (context, index2) {
                                    return controller.categoriesWithProduct[index].products![index2].reduction != 0
                                        ? Column(
                                            children: [
                                              Stack(
                                                children: [
                                                  Image.network(
                                                    '${controller.categoriesWithProduct[index].products![index2].image}',
                                                    width: 300,
                                                    height: 300,
                                                  ),
                                                  Positioned(
                                                    top: 20,
                                                    left: 0,
                                                    child: Container(
                                                      color: Colors.red,
                                                      child: Text(
                                                        '${controller.categoriesWithProduct[index].products![index2].reduction}% de réduction',
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
                                                width: 250,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Text(
                                                      '${controller.categoriesWithProduct[index].products![index2].brand?.toCapitalized()}',
                                                      style: text,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '${controller.categoriesWithProduct[index].products![index2].price}€  ',
                                                          style: const TextStyle(
                                                            decoration: TextDecoration.lineThrough,
                                                            decorationColor: Color.fromARGB(255, 89, 56, 56),
                                                            decorationThickness: 1.8,
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                            color: Color.fromARGB(255, 89, 56, 56),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${controller.getPriceWithReduc(controller.categoriesWithProduct[index].products![index2].price, controller.categoriesWithProduct[index].products![index2].reduction)} €',
                                                          style: text,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      ElevatedButton(
                                                        style: bg,
                                                        child: Text(
                                                          "Voir détails",
                                                          style: text,
                                                        ),
                                                        onPressed: () {
                                                          controller.goToDetails(controller
                                                              .categoriesWithProduct[index].products![index2].id);
                                                        },
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          controller.addToCart(controller
                                                              .categoriesWithProduct[index].products![index2]);
                                                        },
                                                        style: bg,
                                                        child: Text(
                                                          "Ajouter au panier",
                                                          style: text,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              Image.network(
                                                '${controller.categoriesWithProduct[index].products![index2].image}',
                                                width: 300,
                                                height: 300,
                                              ),
                                              SizedBox(
                                                width: 250,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Text(
                                                      '${controller.categoriesWithProduct[index].products![index2].brand?.toCapitalized()}',
                                                      style: text,
                                                    ),
                                                    Text(
                                                      '${controller.getPriceWithReduc(controller.categoriesWithProduct[index].products![index2].price, controller.categoriesWithProduct[index].products![index2].reduction)} €',
                                                      style: text,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      ElevatedButton(
                                                        style: bg,
                                                        child: Text(
                                                          "Voir détails",
                                                          style: text,
                                                        ),
                                                        onPressed: () {
                                                          controller.goToDetails(controller
                                                              .categoriesWithProduct[index].products![index2].id);
                                                        },
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          controller.addToCart(controller
                                                              .categoriesWithProduct[index].products![index2]);
                                                        },
                                                        style: bg,
                                                        child: Text(
                                                          "Ajouter au panier",
                                                          style: text,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
