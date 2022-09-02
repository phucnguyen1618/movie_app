import 'dart:developer';

import 'package:data_api/models/genre/genre.dart';
import 'package:data_api/models/movie/movie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/base/base_controller.dart';
import 'package:movie_app/routes/app_pages.dart';
import 'package:movie_app/shared/constant/commons.dart';

class HomeController extends BaseController
    with GetSingleTickerProviderStateMixin {
  RxList<Movie> popularMovies = RxList();
  RxList<Movie> genreForMovies = RxList();
  RxList<Movie> nowplayingMovies = RxList();
  RxList<Genre> genresList = RxList();
  TabController? tabController;
  RxBool isLoadingNowPlaying = RxBool(true);
  RxBool isLoadingPopular = RxBool(true);

  @override
  Future<void> onInit() async {
    await super.onInit();
    fetchNowPlayingMovies();
    fetchGenres();
    fetchPopularMovies();
  }

  Future<void> fetchNowPlayingMovies() async {
    movieRepository
        .nowplayingMovies(CommonConstants.apiKey, 1)
        .then((response) {
      isLoadingNowPlaying.value = false;
      nowplayingMovies.value = response.movies ?? [];
    }).onError((error, stackTrace) {
      printInfo(info: 'Error: ${error.toString()}');
    });
  }

  Future<void> fetchPopularMovies() async {
    movieRepository
        .popularMovies(CommonConstants.apiKey, 'en-US', 1)
        .then((response) {
      isLoadingPopular.value = false;
      popularMovies.value = response.movies ?? [];
    }).onError((error, stackTrace) {
      printInfo(info: 'Error: ${error.toString()}');
    });
  }

  Future<void> fetchGenres() async {
    movieRepository.genres(CommonConstants.apiKey).then((response) {
      genresList.value = response.genres;
      tabController = TabController(length: genresList.length, vsync: this);
    }).onError((error, stackTrace) {
      printInfo(info: 'Error: ${error.toString()}');
    });
  }

  Future<void> fetchMoviesByGenre(String genreId) async {
    movieRepository
        .discoverMovies(CommonConstants.apiKey, 'en-US', 1, genreId: genreId)
        .then((response) {
      genreForMovies.value = response.movies ?? [];
    }).onError((error, stackTrace) {
      printInfo(info: 'Error: ${error.toString()}');
    });
  }

  List<String> fetchGenresFromMovie(List<int> genresId) {
    List<String> nameGenres = [];
    for (var genre in genresList) {
      for (var item in genresId) {
        if (genre.id == item) {
          nameGenres.add(genre.name);
        }
      }
    }
    return nameGenres;
  }

  onViewMoreClicked(int typeMovie) {
    Get.toNamed(Routes.MOVIE_LIST_SCREEN, arguments: typeMovie);
  }
}
