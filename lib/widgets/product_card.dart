import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../presentation/home/controller/home_screen_controller.dart';

class ProductCard extends GetWidget<HomeScreenController> {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 900,
      width: 500,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.productsList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.network(
                '${controller.productsList[index].image}',
                height: 300,
                width: 300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${controller.productsList[index].brand}'),
                  Text('${controller.productsList[index].price}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: const Text("Voir détails"),
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    child: const Text("Ajouter au panier"),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
