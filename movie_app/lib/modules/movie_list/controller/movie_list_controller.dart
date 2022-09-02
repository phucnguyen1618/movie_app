import 'package:data_api/models/movie/movie.dart';
import 'package:get/get.dart';
import 'package:movie_app/base/base_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../shared/constant/commons.dart';

class MovieListController extends BaseController {
  var result = Get.arguments;
  RxList<Movie> movies = RxList();
  int _page = 1;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Future<void> onInit() async {
    super.onInit();
    loadMovies();
  }

  @override
  Future<void> onClose() async {
    super.onClose();
    _page = 1;
    movies.clear();
  }

  Future<void> _fetchNowPlayingMovies() async {
    movieRepository
        .nowplayingMovies(CommonConstants.apiKey, _page)
        .then((response) {
      movies.addAllIf(response.movies != null, response.movies ?? []);
    }).onError((error, stackTrace) {
      printInfo(info: 'Error: ${error.toString()}');
    });
  }

  Future<void> _fetchPopularMovies() async {
    movieRepository
        .popularMovies(CommonConstants.apiKey, 'en-US', _page)
        .then((response) {
      movies.addAllIf(response.movies != null, response.movies ?? []);
    }).onError((error, stackTrace) {
      printInfo(info: 'Error: ${error.toString()}');
    });
  }

  void onLoading() async {
    _page++;
    loadMovies();
    refreshController.loadComplete();
  }

  void loadMovies() {
    switch (result) {
      case CommonConstants.nowPlayingType:
        _fetchNowPlayingMovies();
        break;
      case CommonConstants.popularType:
        _fetchPopularMovies();
        break;
    }
  }
}
