import 'package:e_commerce_front_getx/widgets/product_card.dart';
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
                  itemCount: controller.categoriesList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text(
                          '${controller.categoriesList[index].name}',
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
                                  itemCount: controller.productsList.length,
                                  itemBuilder: (context, int index) {
                                    return ProductCard();
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
