import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/modules/categories/controller/categories_controller.dart';
import 'package:movie_app/modules/categories/view/item/item_movie.dart';
import 'package:movie_app/shared/constant/colors.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../routes/app_pages.dart';

class CategoriesScreen extends GetView<CategoriesController> {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          controller.data['name'].toString().toUpperCase(),
          style: const TextStyle(
            fontSize: 16.0,
            color: AppColor.titleColor,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColor.titleColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Expanded(
                  child: SmartRefresher(
                    controller: controller.refreshController,
                    onLoading: controller.onLoading,
                    onRefresh: () {},
                    enablePullUp: true,
                    enablePullDown: false,
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: controller.movies.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 0.65,
                        ),
                        itemBuilder: (context, index) {
                          return ItemMovie(movie: controller.movies[index]);
                        }),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
