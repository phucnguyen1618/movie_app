import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/modules/home/controller/home_controller.dart';
import 'package:movie_app/modules/home/view/item/item_nowplaying_movie.dart';
import 'package:movie_app/modules/home/view/item/item_popular_movie.dart';
import 'package:movie_app/shared/constant/colors.dart';
import 'package:movie_app/shared/constant/commons.dart';

import 'genre_movies_widget.dart';

part 'home_screen_extension.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(
        onLeadingPressed: () {},
        onNotifcationPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 24.0,
            ),
            Obx(
              () => _buildMovieList('Now Playing',
                  child: controller.isLoadingNowPlaying.value
                      ? const Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              controller.nowplayingMovies.length,
                              (index) => ItemNowPlayingMovie(
                                movie: controller.nowplayingMovies[index],
                              ),
                            ).toList(),
                          ),
                        ), onPressed: () {
                controller.onViewMoreClicked(CommonConstants.nowPlayingType);
              }),
            ),
            const SizedBox(
              height: 24.0,
            ),
            _buildGenreTabBarList(),
            const SizedBox(
              height: 24.0,
            ),
            Obx(
              () => _buildMovieList('Popular',
                  child: controller.isLoadingPopular.value
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.separated(
                          itemCount: controller.popularMovies.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return InkWell(
                              child: ItemPopularMovie(
                                  movie: controller.popularMovies[index]),
                            );
                          }),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 14.0),
                        ), onPressed: () {
                controller.onViewMoreClicked(CommonConstants.popularType);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
