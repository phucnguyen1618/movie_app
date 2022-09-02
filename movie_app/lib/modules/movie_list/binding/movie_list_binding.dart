import 'package:get/get.dart';
import 'package:movie_app/modules/movie_list/controller/movie_list_controller.dart';

class MovieListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieListController());
  }
}
