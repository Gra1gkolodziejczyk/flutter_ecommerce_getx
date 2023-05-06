import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../widgets/Capitalize.dart';
import '../../widgets/addAddress.dart';
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              image: AssetImage('assets/ShopTaBoard_nobg.png'),
                              height: 150,
                              width: 150,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Row(
                              children: [
                                Text('Profil : ', style: text),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Prénom : ${controller.userModel.value?.firstname?.toCapitalized()}',
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  'Nom : ${controller.userModel.value?.name?.toCapitalized()}'),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  'Email : ${controller.userModel.value?.email}'),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Adresse : ", style: text),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.refresh,
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          controller.getAdress();
                                        },
                                      ),
                                    ],
                                  ),
                                  const ModalWidget()
                                ],
                              )),
                          SizedBox(
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            child: FutureBuilder<int?>(
                              future: controller.getAddressLenght(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<int?> snapshot) {
                                if (snapshot.connectionState ==
                                        ConnectionState.done &&
                                    snapshot.data != 0) {
                                  return Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.data ?? 0,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 250,
                                                height: 120,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
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
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  );
                                } else {
                                  return Center(
                                    child: Column(
                                      children: const [
                                        Text('Vous n\'avez pas d\'adresse'),
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
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
