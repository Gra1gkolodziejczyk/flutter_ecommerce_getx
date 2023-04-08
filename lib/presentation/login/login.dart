import 'package:e_commerce_front_getx/routes/app_routes.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/navigation_drawer.dart';
import 'controller/login_screen_controller.dart';

class LoginScreen extends GetWidget<LoginScreenController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const NavigationDrawerMenu(),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text(
                'Page de connexion',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 50),
              Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      validator: controller.validateEmail,
                      controller: controller.email,
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
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.login();
                          Get.toNamed(AppRoutes.initialRoute);
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
