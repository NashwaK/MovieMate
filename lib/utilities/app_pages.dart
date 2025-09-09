import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movie_mate/ui/home/bind/home_bind.dart';
import 'package:movie_mate/ui/home/view/home_view.dart';
import 'package:movie_mate/ui/splash/bind/splash_bind.dart';
import 'package:movie_mate/ui/splash/view/splash_view.dart';
import 'package:movie_mate/utilities/app_route.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: SplashBind(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBind(),
    ),
  ];
}