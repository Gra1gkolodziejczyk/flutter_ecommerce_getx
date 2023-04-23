import 'package:e_commerce_front_getx/core/utils/initial_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'core/app_export.dart';
import '../../routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await GetStorage.init();
  Stripe.publishableKey = dotenv.get('STRIPE_API_KEY');
  await Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.initialRoute,
    );
  }
}
