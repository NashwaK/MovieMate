import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movie_mate/ui/home/bind/home_bind.dart';
import 'package:movie_mate/ui/home/view/home_view.dart';
import 'package:movie_mate/ui/movie_details/bind/movie_details_bind.dart';
import 'package:movie_mate/ui/movie_details/view/movie_details_view.dart';
import 'package:movie_mate/ui/splash/bind/splash_bind.dart';
import 'package:movie_mate/ui/splash/view/splash_view.dart';
import 'package:movie_mate/ui/welcome/First/bind/first_bind.dart';
import 'package:movie_mate/ui/welcome/First/view/first_view.dart';
import 'package:movie_mate/ui/welcome/second/bind/second_bind.dart';
import 'package:movie_mate/ui/welcome/second/view/second_view.dart';
import 'package:movie_mate/ui/wishlist/bind/wishlist_bind.dart';
import 'package:movie_mate/ui/wishlist/view/wishlist_view.dart';
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
      page: () => HomeView(),
      binding: HomeBind(),
    ),
    GetPage(
      name: Routes.firstWelcome,
      page: () => const FirstWelcomeView(),
      binding: FirstWelcomeBind(),
    ),
    GetPage(
      name: Routes.secondWelcome,
      page: () => const SecondWelcomeView(),
      binding: SecondWelcomeBind(),
    ),
    GetPage(
      name: Routes.movieDetails,
      page: () => const MovieDetailsView(),
      binding: MovieDetailsBind(),
    ),
    GetPage(
      name: Routes.wishList,
      page: () => const WishlistView(),
      binding: WishlistBind(),
    ),
  ];
}