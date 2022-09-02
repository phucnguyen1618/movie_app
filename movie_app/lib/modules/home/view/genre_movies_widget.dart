import 'package:data_api/models/movie/movie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/modules/home/controller/home_controller.dart';

import 'item/item_genre_movie.dart';

class GenreMoviesWidget extends GetView<HomeController> {
  final List<Movie> movieList;
  const GenreMoviesWidget({
    Key? key,
    required this.movieList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
        children: movieList
            .map((item) => ItemGenreMovie(movie: item))
            .toList(),
    ),
      ),
    );
  }
}
