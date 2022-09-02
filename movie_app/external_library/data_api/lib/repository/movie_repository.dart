import 'package:data_api/response/movie/cast_response.dart';
import 'package:data_api/response/movie/movie_detail_response.dart';
import 'package:data_api/response/movie/movie_response.dart';
import 'package:data_api/response/movie/review_response.dart';

import '../models/movie/detail/movie_detail.dart';
import '../response/genre/genre_response.dart';

abstract class MovieRepository {
  Future<MovieResponse> discoverMovies(
    String apiKey,
    String language,
    int page, {
    String? genreId,
  });

  Future<MovieResponse> topRatedMovies(
      String apiKey, String language, int page);

  Future<MovieResponse> popularMovies(String apiKey, String language, int page);

  Future<MovieDetailResponse> movieDetail(String apiKey, int idMovie);

  Future<MovieResponse> similarMovies(String apiKey, int movieId, int page);

  Future<MovieResponse> trendingMoviesForMovie(String apiKey);

  Future<MovieResponse> upcomingMovies(String apiKey, int page);

  Future<MovieResponse> nowplayingMovies(String apiKey, int page);

  Future<ReviewResponse> reviewsForMovie(String apiKey, int movieId, int page);

  Future<GenreResponse> genres(String apiKey);

  Future<MovieResponse> search(String apiKey, String query);

  Future<CastResponse> casts(String apiKey, int movieId);

  Future<MovieResponse> recommendations(String apiKey, int movieId, int page);
}
