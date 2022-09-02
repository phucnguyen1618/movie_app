import 'package:get/get.dart';
import 'package:movie_app/modules/categories/controller/categories_controller.dart';

class CategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoriesController());
  }
}
