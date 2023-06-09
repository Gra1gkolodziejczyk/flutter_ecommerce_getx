import '../core/app_export.dart';
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
import '../presentation/reset_password/reset_password.dart';

class AppRoutes {
  static String initialRoute = '/';
  static String profile = '/profile';
  static String panier = '/panier';
  static String login = '/login';
  static String register = '/register';
  static String resetPassword = '/resetPassword';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => const HomeScreen(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: profile,
      page: () => const ProfileScreen(),
      binding: ProfileScreenBinding(),
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
      binding: RegisterScreenBinding(),
    ),
  ];
}