import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/navigation_drawer.dart';
import '../home/controller/home_screen_controller.dart';

class HomeScreen extends GetWidget<HomeScreenController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const NavigationDrawerMenu(),
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
                          '${controller.categoriesWithProduct[index].name}',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          children: [
                            Obx(
                              () => SizedBox(
                                height: 500,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller
                                      .categoriesWithProduct[index]
                                      .products
                                      ?.length,
                                  itemBuilder: (context, index2) {
                                    return Column(
                                      children: [
                                        Image.network(
                                          '${controller.categoriesWithProduct[index].products![index2].image}',
                                          width: 300,
                                          height: 300,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${controller.categoriesWithProduct[index].products![index2].brand}',
                                            ),
                                            Text(
                                              '${controller.categoriesWithProduct[index].products![index2].price}',
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ElevatedButton(
                                                  child: const Text(
                                                      "Voir détails"),
                                                  onPressed: () {},
                                                ),
                                                ElevatedButton(
                                                  child: const Text(
                                                      "Ajouter au panier"),
                                                  onPressed: () {},
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
