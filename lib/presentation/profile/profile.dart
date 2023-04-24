import 'package:flutter/material.dart';
import '../../core/app_export.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/navigation_drawer.dart';
import 'controller/profile_screen_controller.dart';
import '../../widgets/Capitalize.dart';

class ProfileScreen extends GetWidget<ProfileScreenController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const NavigationDrawerMenu(),
      backgroundColor: const Color.fromARGB(255, 255, 253, 247),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 149,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage('assets/ShopTaBoard_nobg.png'),
                        height: 150,
                        width: 150,
                      ),
                      Row(
                        children: [
                          Text(
                              'Prénom : ${controller.userModel.value?.firstname}'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Nom : ${controller.userModel.value?.name}'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Email : ${controller.userModel.value?.email}'),
                        ],
                      ),
                      SizedBox(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.addressModel.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: Colors.red,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                                'Adresse : ${controller.addressModel[index].addressNumber}'
                                                ' ${controller.addressModel[index].address}'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                'Code Postal : ${controller.addressModel[index].addressName}'),
                                          ],
                                        ),
                                        Row(
                                          children: [Text("test")],
                                        )
                                        /* Row(
                                          children: [
                                            Text(
                                                'Code Postal : ${controller.addressModel.value?.address?[0].postalCode} ${controller.addressModel.value?.address?[0].city?.toCapitalized()}'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                'Pays : ${controller.addressModel.value?.address?[0].country?.toCapitalized()}'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                'Télephone : ${controller.addressModel.value?.address?[0].tel}'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: Colors.red,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                                'Adresse : ${controller.addressModel.value?.address?[1].addressNumber}'
                                                ' ${controller.addressModel.value?.address?[1].addressName}'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                'Code Postal : ${controller.addressModel.value?.address?[1].postalCode} ${controller.addressModel.value?.address?[1].city?.toCapitalized()}'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                'Pays : ${controller.addressModel.value?.address?[1].country?.toCapitalized()}'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                'Télephone : ${controller.addressModel.value?.address?[1].tel}'),
                                          ],
                                        ), */
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
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
