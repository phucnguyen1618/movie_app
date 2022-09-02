import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/base/app_binding.dart';
import 'package:movie_app/routes/app_pages.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: INITIAL,
      initialBinding: AppBinding(),
      getPages: pages,
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
