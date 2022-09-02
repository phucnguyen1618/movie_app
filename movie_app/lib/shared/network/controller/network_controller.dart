import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movie_app/shared/network/constant/constant.dart';

class NetworkController extends GetxController {
  
  RxInt connectionStatus = INSTANCE_NETWORK.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  Future<void> onInit() async {
    super.onInit();

    await initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    ConnectivityResult? result;
    try {
      result = await _connectivity.checkConnectivity();
      printInfo(info: 'Kết quả kết nối mạng: $result');
    } on PlatformException catch (error) {
      printError(info: error.toString());
      result = null;
    }
    await _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult? result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = WIFI_NETWORK;
        break;
      case ConnectivityResult.mobile:
        connectionStatus.value = MOBILE_NETWORK;
        break;
      case ConnectivityResult.none:
        connectionStatus.value = 0;
        break;
      default:
        Get.snackbar('Cảnh báo', 'Kết nối mạng đang bị gián đoạn');
        break;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
