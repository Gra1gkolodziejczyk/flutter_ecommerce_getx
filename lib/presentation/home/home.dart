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
              () => SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 149,
                  child: ListView.builder(
                    itemCount: controller.productsList.length,
                    addAutomaticKeepAlives: false,
                    addRepaintBoundaries: false,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Image.network(
                                '${controller.productsList[index].image}'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '${controller.productsList[index].name}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${controller.productsList[index].price} €',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text("See details"),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text("Add to cart"),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
