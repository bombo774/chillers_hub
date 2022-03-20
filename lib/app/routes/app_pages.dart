import 'package:chillers_hub/app/modules/settings/bindings/settings_binding.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/homeMain/bindings/home_main_binding.dart';
import '../modules/homeMain/views/home_main_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      transition: Transition.noTransition,
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      transition: Transition.zoom,
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      transition: Transition.noTransition,
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const HomeMainView(),
      transition: Transition.noTransition,
      binding: HomeMainBinding(),
    ),
    GetPage(
      name: _Paths.HOME_MAIN,
      page: () => const HomeMainView(),
      transition: Transition.noTransition,
      binding: HomeMainBinding(),
    ),
  ];
}
