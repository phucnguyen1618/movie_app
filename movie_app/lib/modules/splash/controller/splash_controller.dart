import 'package:get/get.dart';
import 'package:movie_app/base/base_controller.dart';
import 'package:movie_app/routes/app_pages.dart';

class SplashController extends BaseController {
  @override
  Future<void> onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await Future.delayed(const Duration(seconds: 3));
    Get.offAndToNamed(Routes.HOME_SCREEN);
  }
}
