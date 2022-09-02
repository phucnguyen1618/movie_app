import 'dart:developer';

import 'package:data_api/models/credits/cast.dart';
import 'package:data_api/models/movie/detail/movie_detail.dart';
import 'package:data_api/models/movie/movie.dart';
import 'package:data_api/models/movie/review/review.dart';
import 'package:get/get.dart';
import 'package:movie_app/base/base_controller.dart';
import 'package:movie_app/shared/constant/commons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MovieDetailController extends BaseController {
  var movieId = Get.arguments;
  Rxn<MovieDetail> movieDetail = Rxn<MovieDetail>();
  RxBool isExpanded = RxBool(false);
  RxList<Movie> similarMovies = RxList();
  RxList<Movie> recommendationMovies = RxList();
  RxList<Review> reviews = RxList();
  RxList<Cast> castList = RxList();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  int _page = 1;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchMovieDetail();
  }

  Future<void> fetchMovieDetail() async {
    movieRepository
        .movieDetail(CommonConstants.apiKey, movieId)
        .then((response) {
      movieDetail.value = response.movieDetail;
      if (movieDetail.value != null) {
        fetchMovieSimilarMovieList(movieDetail.value!.id);
        fetchReviewsForMovie(movieDetail.value!.id);
        fetchCastList(movieDetail.value!.id);
        fetchRecommendationsForMovie(movieDetail.value!.id);
      }
    }).onError((error, stackTrace) {
      log('Error: $error');
    });
  }

  Future<void> fetchMovieSimilarMovieList(int movieId) async {
    movieRepository
        .similarMovies(CommonConstants.apiKey, movieId, 1)
        .then((response) {
      similarMovies.value = response.movies ?? [];
    }).onError((error, stackTrace) {
      log('Error: $error');
    });
  }

  Future<void> fetchReviewsForMovie(int movieId) async {
    movieRepository
        .reviewsForMovie(CommonConstants.apiKey, movieId, _page)
        .then((response) {
      reviews.addAll(response.reviews);
    }).onError((error, stackTrace) {
      log('Error: $error');
    });
  }

  Future<void> fetchCastList(int movieId) async {
    movieRepository.casts(CommonConstants.apiKey, movieId).then((response) {
      castList.value = response.castList;
    }).onError((error, stackTrace) {
      log('Error: $error');
    });
  }

  Future<void> fetchRecommendationsForMovie(int movieId) async {
    movieRepository
        .recommendations(CommonConstants.apiKey, movieId, _page)
        .then((response) {
      recommendationMovies.addAll(response.movies ?? []);
    });
  }

  void onLoading() async {
    _page++;
    fetchReviewsForMovie(movieId);
    refreshController.loadComplete();
  }

  void expanded() {
    isExpanded.value = !isExpanded.value;
  }

  String displayReleaseDate(String input) {
    return input.split('-')[0];
  }
}
