import 'package:data_api/datasource/movie_api.dart';
import 'package:data_api/repository/movie_repository.dart';
import 'package:data_api/response/movie/cast_response.dart';
import 'package:data_api/response/movie/movie_detail_response.dart';
import 'package:data_api/response/movie/movie_response.dart';
import 'package:data_api/response/movie/review_response.dart';

import '../../response/genre/genre_response.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieAPI _api;

  MovieRepositoryImpl(this._api);

  @override
  Future<MovieResponse> discoverMovies(
    String apiKey,
    String language,
    int page, {
    String? genreId,
  }) {
    return _api.getDiscoverMovies(
      apiKey,
      language,
      page,
      idGenres: genreId,
    );
  }

  @override
  Future<GenreResponse> genres(String apiKey) {
    return _api.getGenres(apiKey);
  }

  @override
  Future<MovieDetailResponse> movieDetail(String apiKey, int idMovie) {
    return _api.getMovieDetail(apiKey, idMovie);
  }

  @override
  Future<MovieResponse> popularMovies(
      String apiKey, String language, int page) {
    return _api.getPopularMovies(apiKey, language, page);
  }

  @override
  Future<MovieResponse> similarMovies(String apiKey, int movieId, int page) {
    return _api.getSimilarMovies(apiKey, movieId, page);
  }

  @override
  Future<MovieResponse> topRatedMovies(
      String apiKey, String language, int page) {
    return _api.getTopRatedMovies(apiKey, language, page);
  }

  @override
  Future<MovieResponse> search(String apiKey, String query) {
    return _api.search(apiKey, query);
  }

  @override
  Future<MovieResponse> nowplayingMovies(String apiKey, int page) {
    return _api.getNowPlayingMovies(apiKey, page);
  }

  @override
  Future<ReviewResponse> reviewsForMovie(String apiKey, int movieId, int page) {
    return _api.getReviewsForMovie(apiKey, movieId, page);
  }

  @override
  Future<MovieResponse> trendingMoviesForMovie(String apiKey) {
    return _api.getTrendingMoviesForWeek(apiKey);
  }

  @override
  Future<MovieResponse> upcomingMovies(String apiKey, int page) {
    return _api.getUpComingMovies(apiKey, page);
  }

  @override
  Future<CastResponse> casts(String apiKey, int movieId) {
    return _api.getCastListForMovie(apiKey, movieId);
  }

  @override
  Future<MovieResponse> recommendations(String apiKey, int movieId, int page) {
    return _api.getMovieRecommendations(apiKey, movieId, page);
  }
}
