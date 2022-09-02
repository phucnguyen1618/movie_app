import 'package:data_api/repository/movie_repository.dart';
import 'package:get/get.dart';
import 'package:movie_app/shared/network/constant/constant.dart';
import 'package:movie_app/shared/network/controller/network_controller.dart';
import 'package:movie_app/shared/network/manager/network_manager.dart';

import '../shared/dialog_manager/data_models/request/common_dialog_request.dart';
import '../shared/dialog_manager/service/dialog_service.dart';

class BaseController extends GetxController with NetworkManager {
  var _hasNetwork = true;
  final _networkController = Get.find<NetworkController>();
  final movieRepository = Get.find<MovieRepository>();

  @override
  Future<void> onInit() async {
    super.onInit();
    await checkNetworkConnection();
  }

  Future<void> checkNetworkConnection() async {
    if (_networkController.connectionStatus.value == 0) {
      _hasNetwork = false;
    }
    _networkController.connectionStatus.listen((status) {
      if (status == 0) {
        _hasNetwork = false;
        callDialogErrorNetwork();
      } else {
        _hasNetwork = true;
      }
    });
  }

  Future<void> doShowDialog(CommonDialogRequest dialogRequest) async {
    final locator = Get.find<DialogService>();
    final dialogResult = await locator.showDialog(dialogRequest);

    if (dialogResult.confirmed) {
      printInfo(info: 'User press confirm');
      await _handleEventDialog(dialogRequest.defineEvent);
    } else {
      printInfo(info: 'User press cancel!');
    }
  }

  Future<void> _handleEventDialog(String? defineEvent) async {
    switch (defineEvent) {
      case NO_CONNECT_NETWORK:
        if (!_hasNetwork) {
          await callDialogErrorNetwork();
        }
        break;
      default:
        break;
    }
  }

  Future<void> callDialogErrorNetwork() async {
    final dialogRequest = CommonDialogRequest(
      title: 'Thông báo',
      description: 'Mạng của bạn đang gặp sự cố. Hãy kiểm tra lại mạng.',
      defineEvent: NO_CONNECT_NETWORK,
    );
    await doShowDialog(dialogRequest);
  }
}
