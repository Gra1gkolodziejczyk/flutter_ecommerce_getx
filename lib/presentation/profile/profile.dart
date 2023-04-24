import 'package:flutter/material.dart';
import '../../core/app_export.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/navigation_drawer.dart';
import 'controller/profile_screen_controller.dart';

class ProfileScreen extends GetWidget<ProfileScreenController> {
  const ProfileScreen({Key? key}) : super(key: key);

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
                          Text('Profil : ', style: text),
                        ],
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
                      Row(
                        children: [
                          Text('Adresse : ', style: text),
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
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                                '${controller.addressModel[index].addressName}')
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                '${controller.addressModel[index].userFirstName}'
                                                ' ${controller.addressModel[index].userName}'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                '${controller.addressModel[index].addressNumber}'
                                                ' ${controller.addressModel[index].address}'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                '${controller.addressModel[index].postalCode}'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                ' ${controller.addressModel[index].city}')
                                          ],
                                        )
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
