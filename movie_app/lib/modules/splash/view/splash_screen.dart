import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/modules/splash/controller/splash_controller.dart';
import 'package:movie_app/routes/app_pages.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.HOME_SCREEN);
              },
              child: const FlutterLogo(
                size: 48.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
