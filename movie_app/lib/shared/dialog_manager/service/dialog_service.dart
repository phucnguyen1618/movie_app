import 'dart:async';

import '../data_models/request/common_dialog_request.dart';
import '../data_models/response/common_dialog_response.dart';

class DialogService {
  late Function(CommonDialogRequest) showCommonDialogListener;
  late Completer<CommonDialogResponse> _commonDialogCompleter;

  Future<CommonDialogResponse> showDialog(CommonDialogRequest request) {
    _commonDialogCompleter = Completer<CommonDialogResponse>();
    showCommonDialogListener(CommonDialogRequest(
      title: request.title,
      description: request.description,
      typeDialog: request.typeDialog,
      okTextButton: request.okTextButton,
      isMustTapButton: request.isMustTapButton,
    ));
    return _commonDialogCompleter.future;
  }

  void commonDialogComplete(CommonDialogResponse response) {
    if (!_commonDialogCompleter.isCompleted) {
      _commonDialogCompleter.complete(response);
    }
  }
}