import 'package:get/get.dart';
import 'package:movie_app/shared/network/constant/constant.dart';
import 'package:movie_app/shared/network/controller/network_controller.dart';

abstract class NetworkManager {
  Future<bool> hasConnectNetwork() async {
    final _controller = Get.find<NetworkController>();
    if (_controller.connectionStatus.value != WIFI_NETWORK &&
        _controller.connectionStatus.value != MOBILE_NETWORK &&
        _controller.connectionStatus.value != INSTANCE_NETWORK) {
      return false;
    }
    return true;
  }
}
