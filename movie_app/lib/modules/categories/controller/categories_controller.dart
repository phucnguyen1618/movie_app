import 'package:data_api/models/movie/movie.dart';
import 'package:get/get.dart';
import 'package:movie_app/base/base_controller.dart';
import 'package:movie_app/shared/constant/commons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CategoriesController extends BaseController {
  var data = Get.arguments;
  RxList<Movie> movies = RxList();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  int _page = 1;

  @override
  Future<void> onInit() {
    fetchMoviesByGenre();
    return super.onInit();
  }

  @override
  Future<void> onClose() async {
    super.onClose();
    movies.clear();
    _page = 1;
  }

  void onLoading() async {
    _page++;
    fetchMoviesByGenre();
    refreshController.loadComplete();
  }

  Future<void> fetchMoviesByGenre() async {
    movieRepository
        .discoverMovies(CommonConstants.apiKey, 'en-US', _page,
            genreId: data['id'].toString())
        .then((response) {
      if (response.movies != null) {
        movies.addAll(response.movies!);
      }
    });
  }
}
