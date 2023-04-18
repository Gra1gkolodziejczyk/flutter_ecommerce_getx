import 'package:e_commerce_front_getx/routes/app_routes.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/navigation_drawer.dart';
import './controller/login_screen_controller.dart';

class LoginScreen extends GetWidget<LoginScreenController> {
  const LoginScreen({Key? key}) : super(key: key);

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
                width: 370,
                height: 370,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Form(
                  key: controller.formKeyLogin,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        validator: controller.validateEmail,
                        controller: controller.email,
                        autofocus: false,
                        decoration: const InputDecoration(
                          labelText: "E-mail",
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        validator: controller.validatePassword,
                        controller: controller.password,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Mot de passe",
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          if (controller.formKeyLogin.currentState!
                              .validate()) {
                            controller.login();
                          }
                        },
                        child: const Text('Connexion'),
                      ),
                      Row(
                        children: [
                          const Text("Vous n'avez pas encore de compte ? "),
                          const SizedBox(height: 100),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.register);
                              },
                              child: const Text(
                                "Inscrivez-vous",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.resetPassword);
                        },
                        child: const Text(
                          "Mot de passe oublié ?",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
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
