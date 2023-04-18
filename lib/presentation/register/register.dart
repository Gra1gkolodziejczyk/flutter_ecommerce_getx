import 'package:e_commerce_front_getx/routes/app_routes.dart';
import 'package:e_commerce_front_getx/widgets/custom_appbar.dart';
import 'package:e_commerce_front_getx/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'controller/register_screen_controller.dart';

class RegisterScreen extends GetWidget<RegisterScreenController> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const NavigationDrawerMenu(),
      backgroundColor: const Color.fromARGB(255, 255, 253, 247),
      body: SafeArea(
        child: SizedBox(
          child: Column(
            children: [
              Image.asset(
                'assets/ShopTaBoard.png',
                width: 270,
                height: 270,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Form(
                  key: controller.formKeyRegister,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: TextFormField(
                          validator: controller.validateName,
                          controller: controller.name,
                          decoration: const InputDecoration(
                            labelText: "Nom",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: TextFormField(
                          validator: controller.validateFirstname,
                          controller: controller.firstname,
                          decoration: const InputDecoration(
                            labelText: "Prénom",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: TextFormField(
                          validator: controller.validateEmail,
                          controller: controller.email,
                          autofocus: false,
                          decoration: const InputDecoration(
                            labelText: "E-mail",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: TextFormField(
                          validator: controller.validatePassword,
                          controller: controller.password,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Mot de passe",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: TextFormField(
                          validator: controller.validateConfirmpassword,
                          controller: controller.confirmpassword,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Confirmer votre mot de passe",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            if (controller.formKeyRegister.currentState!
                                .validate()) {
                              controller.register();
                            }
                          },
                          child: const Text('Inscription'),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text("Vous avez déjà un compte ? "),
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.login);
                            },
                            child: const Text(
                              "Connectez-vous",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
