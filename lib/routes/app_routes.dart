import 'package:e_commerce_front_getx/presentation/checkout/checkout.dart';
import 'package:e_commerce_front_getx/presentation/details/binding/details_screen_binding.dart';
import 'package:e_commerce_front_getx/presentation/details/details.dart';

import '../core/app_export.dart';
import '../core/authentification/authentification_middleware.dart';
import '../presentation/checkout/binding/checkout_screen_binding.dart';
import '../presentation/commandes/binding/commandes_screen_binding.dart';
import '../presentation/commandes/commandes.dart';
import '../presentation/favoris/binding/favoris_screen_binding.dart';
import '../presentation/favoris/favoris.dart';
import '../presentation/home/binding/home_screen_binding.dart';
import '../presentation/home/home.dart';
import '../presentation/login/binding/login_screen_binding.dart';
import '../presentation/login/login.dart';
import '../presentation/panier/binding/panier_screen_binding.dart';
import '../presentation/panier/panier.dart';
import '../presentation/profile/binding/profile_screen_binding.dart';
import '../presentation/profile/profile.dart';
import '../presentation/register/binding/register_screen_binding.dart';
import '../presentation/register/register.dart';
import '../presentation/reset_password/binding/reset_password_screen_binding.dart';
import '../presentation/reset_password/reset_password.dart';

class AppRoutes {
  static String initialRoute = '/';
  static String profile = '/profile';
  static String panier = '/panier';
  static String login = '/login';
  static String register = '/register';
  static String resetPassword = '/resetPassword';
  static String favoris = '/favoris';
  static String commandes = '/commandes';
  static String checkout = '/checkout';
  static String details = '/details';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => HomeScreen(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: profile,
      page: () => const ProfileScreen(),
      binding: ProfileScreenBinding(),
      middlewares: [AuthentificationMiddleware()],
    ),
    GetPage(
      name: panier,
      page: () => const PanierScreen(),
      binding: PanierScreenBinding(),
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: register,
      page: () => const RegisterScreen(),
      binding: RegisterScreenBinding(),
    ),
    GetPage(
      name: resetPassword,
      page: () => const ResetPasswordScreen(),
      binding: ResetPasswordScreenBinding(),
    ),
    GetPage(
      name: favoris,
      page: () => const FavorisScreen(),
      binding: FavorisScreenBinding(),
      middlewares: [AuthentificationMiddleware()],
    ),
    GetPage(
      name: commandes,
      page: () => const CommandesScreen(),
      binding: CommandesScreenBinding(),
      middlewares: [AuthentificationMiddleware()],
    ),
    GetPage(
      name: details,
      page: () => DetailsScreen(),
      binding: DetailsScreenBinding(),
    ),
    GetPage(
        name: checkout,
        page: () => const CheckoutScreen(),
        binding: CheckoutScreenBinding(),
        middlewares: [AuthentificationMiddleware()])
  ];
}
