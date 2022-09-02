import 'package:get/get.dart';
import 'package:movie_app/shared/network/controller/network_controller.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}