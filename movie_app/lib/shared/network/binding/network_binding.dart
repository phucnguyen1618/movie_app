import 'package:get/get.dart';
import 'package:movie_app/shared/network/controller/network_controller.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkController>(() => NetworkController());
  }
}