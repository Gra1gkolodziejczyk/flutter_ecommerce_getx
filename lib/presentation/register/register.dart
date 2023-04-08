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
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const Text(
                "Page d'inscription",
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
                      validator: controller.validateName,
                      controller: controller.name,
                      decoration: const InputDecoration(
                        labelText: "Nom",
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: controller.validateFirstname,
                      controller: controller.firstname,
                      decoration: const InputDecoration(
                        labelText: "Prénom",
                      ),
                    ),
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: controller.validateConfirmpassword,
                      controller: controller.confirmpassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Confirmer votre mot de passe",
                      ),
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.register();
                          Get.toNamed(AppRoutes.initialRoute);
                        }
                      },
                      child: const Text('Inscription'),
                    ),
                    const SizedBox(height: 30),
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
            ],
          ),
        ),
      ),
    );
  }
}
