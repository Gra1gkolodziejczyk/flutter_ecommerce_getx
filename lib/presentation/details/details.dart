import 'package:e_commerce_front_getx/core/authentification/cache_manager.dart';
import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_appbar.dart';
import 'controller/details_screen_controller.dart';

class DetailsScreen extends GetWidget<DetailsScreenController>
    with CacheManager {
  DetailsScreen({Key? key}) : super(key: key);

  final TextStyle text = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 0, 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: const Color.fromARGB(255, 255, 253, 247),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              controller.getProductById();
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 149,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        '${controller.detailsModel.value!.name}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Image.network(
                        '${controller.detailsModel.value!.image}',
                        width: 200,
                        height: 300,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text('Marque: '),
                                Text(
                                  '${controller.detailsModel.value!.brand}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '${controller.detailsModel.value!.price}€  ',
                                  style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor:
                                        Color.fromARGB(255, 0, 0, 0),
                                    decorationThickness: 1.8,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                Text(
                                  '${controller.getPriceWithReduc(controller.detailsModel.value!.price, controller.detailsModel.value!.reduction)} €',
                                  style: text,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text('Size: '),
                                Text(
                                  '${controller.detailsModel.value!.size}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                const Text('Reduction: '),
                                Text(
                                  '${controller.detailsModel.value?.reduction}',
                                  style: text,
                                ),
                                const Text('%'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Description :',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  '${controller.detailsModel.value?.description}',
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            controller.addToCart(controller.detailsModel.value);
                          },
                          child: const Text('Add To Cart'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
