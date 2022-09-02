import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/modules/movie_list/controller/movie_list_controller.dart';
import 'package:movie_app/modules/movie_list/view/item_movie.dart';
import 'package:movie_app/shared/constant/commons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/constant/colors.dart';

part 'movie_list_screen_children.dart';

class MovieListScreen extends GetView<MovieListController> {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(
        controller.result == CommonConstants.nowPlayingType
            ? 'Now Playing'
            : 'Popular',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                          return InkWell(
                            child: ItemMovie(movie: controller.movies[index]),
                            onTap: () {
                              Get.toNamed(
                                Routes.MOVIE_DETAIL_SCREEN,
                                arguments: controller.movies[index].id,
                              );
                            },
                          );
                        }),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
