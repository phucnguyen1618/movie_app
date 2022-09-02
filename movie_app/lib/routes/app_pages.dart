import 'package:get/get.dart';
import 'package:movie_app/modules/categories/binding/categories_binding.dart';
import 'package:movie_app/modules/categories/view/categories_screen.dart';
import 'package:movie_app/modules/detail/binding/movie_detail_binding.dart';
import 'package:movie_app/modules/detail/view/movie_detail_screen.dart';
import 'package:movie_app/modules/home/binding/home_binding.dart';
import 'package:movie_app/modules/home/view/home_screen.dart';
import 'package:movie_app/modules/movie_list/binding/movie_list_binding.dart';
import 'package:movie_app/modules/movie_list/view/movie_list_screen.dart';
import 'package:movie_app/modules/person/binding/person_binding.dart';
import 'package:movie_app/modules/person/view/person_screen.dart';
import 'package:movie_app/modules/splash/binding/splash_binding.dart';
import 'package:movie_app/modules/splash/view/splash_screen.dart';

part 'app_routes.dart';

const INITIAL = Routes.SPLASH_SCREEN;

final pages = [
  GetPage(
    name: Routes.SPLASH_SCREEN,
    page: () => const SplashScreen(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: Routes.HOME_SCREEN,
    page: () => const HomeScreen(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: Routes.MOVIE_DETAIL_SCREEN,
    page: () => const MovieDetailScreen(),
    binding: MovieDetailBinding(),
  ),
  GetPage(
    name: Routes.MOVIE_LIST_SCREEN,
    page: () => const MovieListScreen(),
    binding: MovieListBinding(),
  ),
  GetPage(
    name: Routes.CATEGORIES_SCREEN,
    page: () => const CategoriesScreen(),
    binding: CategoriesBinding(),
  ),
  GetPage(
    name: Routes.PERSON_SCREEN,
    page: () => const PersonScreen(),
    binding: PersonBinding(),
  ),
];
