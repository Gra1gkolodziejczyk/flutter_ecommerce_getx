import 'package:e_commerce_front_getx/presentation/checkout/controller/checkout_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../widgets/addAddress.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/navigation_drawer.dart';

class CheckoutScreen extends GetWidget<CheckoutScreenController> {
  const CheckoutScreen({Key? key}) : super(key: key);

  final TextStyle text = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 0, 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        drawer: const NavigationDrawerMenu(),
        backgroundColor: const Color.fromARGB(255, 255, 253, 247),
        body: SafeArea(
          child: Obx(() => SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  FutureBuilder<int?>(
                      future: controller.getAddressLenght(),
                      builder:
                          (BuildContext context, AsyncSnapshot<int?> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.data != 0) {
                          return Column(
                            children: [
                              Text(
                                "Choisissez une adresse : ",
                                style: text,
                              ),
                              const Center(child: ModalWidget()),
                              SizedBox(
                                  height: 110,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data ?? 0,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          controller.selectAddress(
                                              controller.addressList[index].id);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black,
                                                width: 2,
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                    '${controller.addressList[index].addressName}'),
                                                Text(
                                                    '${controller.addressList[index].userFirstName}'
                                                    ' ${controller.addressList[index].userName}'),
                                                Text(
                                                    '${controller.addressList[index].addressNumber}'
                                                    ' ${controller.addressList[index].address}'),
                                                Text(
                                                    '${controller.addressList[index].postalCode}'),
                                                Text(
                                                    ' ${controller.addressList[index].city}')
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  controller.addressId.value != ''
                                      ? ElevatedButton(
                                          onPressed: () async {
                                            controller.startCheckout();
                                          },
                                          child: const Text('Payer le Panier'))
                                      : const Text("Sélectionne une adresse")
                                ],
                              )
                            ],
                          );
                        } else {
                          return Center(
                            child: Column(children: [
                              Text('Veuillez ajouter une adresse'),
                              ModalWidget()
                            ]),
                          );
                        }
                      }),
                ]),
              )),
        ));
  }
}
