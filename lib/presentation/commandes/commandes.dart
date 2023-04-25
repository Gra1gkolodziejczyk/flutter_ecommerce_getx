import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/navigation_drawer.dart';
import 'controller/commandes_screen_controller.dart';
import 'package:intl/intl.dart';

class CommandesScreen extends GetWidget<CommandesScreenController> {
  const CommandesScreen({Key? key}) : super(key: key);

  final TextStyle text = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 0, 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const NavigationDrawerMenu(),
      body: SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<int?>(
            future: controller.getCommandLenght(),
            builder: (BuildContext context, AsyncSnapshot<int?> snapshot) {
              if (controller.getCommandLenght() == 0) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Commandes :', style: text),
                    const Text("Vous n'avez pas encore de commandes"),
                  ],
                );
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: [
                    Text('Commandes :', style: text),
                    Expanded(
                        child: ListView.builder(
                      itemCount: snapshot.data ?? 0,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            side: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Prix: ${controller.commandList[index].price}€"),
                                Text(
                                    "Faite le ${DateFormat('dd-MM-yyyy').format(controller.commandList[index].date)}")
                              ],
                            ),
                          ),
                        );
                      },
                    ))
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      )),
    );
  }
}
