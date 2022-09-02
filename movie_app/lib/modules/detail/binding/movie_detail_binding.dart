import 'package:get/get.dart';
import 'package:movie_app/modules/detail/controller/movie_detail_controller.dart';

class MovieDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieDetailController());
  }

}