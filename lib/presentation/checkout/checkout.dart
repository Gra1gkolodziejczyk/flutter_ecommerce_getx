import 'package:e_commerce_front_getx/presentation/checkout/controller/checkout_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/navigation_drawer.dart';

class CheckoutScreen extends GetWidget<CheckoutScreenController> {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        drawer: const NavigationDrawerMenu(),
        backgroundColor: const Color.fromARGB(255, 255, 253, 247),
        body: SafeArea(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.addressList.isEmpty
                  ? ElevatedButton(
                      onPressed: () async {
                        controller.startCheckout();
                      },
                      child: const Text('Payer le Panier'))
                  : const Text("you need have an address")
            ],
          )),
        ));
  }
}
