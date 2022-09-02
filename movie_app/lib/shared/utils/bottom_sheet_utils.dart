import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BottomSheetUtils {
  static Future<void> showBottomSheetReviews({required Widget child}) async {
    showCupertinoModalBottomSheet(
      context: Get.overlayContext!,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      )),
      builder: (context) => child,
    );
  }

}
