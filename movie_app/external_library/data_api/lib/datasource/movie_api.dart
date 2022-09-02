import 'package:data_api/response/movie/cast_response.dart';
import 'package:data_api/response/movie/movie_detail_response.dart';
import 'package:data_api/response/movie/movie_response.dart';
import 'package:data_api/response/movie/review_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../response/genre/genre_response.dart';

part 'movie_api.g.dart';

@RestApi()
abstract class MovieAPI {
  factory MovieAPI(Dio dio, {String baseUrl}) = _MovieAPI;

  // Get Popular Movies
  @GET('/movie/popular')
  Future<MovieResponse> getPopularMovies(
    @Query('api_key') String apiKey,
    @Query('language') String language,
    @Query('page') int page,
  );

  // Get TopRated Movies
  @GET('/movie/top_rated')
  Future<MovieResponse> getTopRatedMovies(
    @Query('api_key') String apiKey,
    @Query('language') String language,
    @Query('page') int page,
  );

  // Get Discover Movies
  @GET('/discover/movie')
  Future<MovieResponse> getDiscoverMovies(
    @Query('api_key') String apiKey,
    @Query('language') String language,
    @Query('page') int page, {
    @Query('with_genres') String? idGenres,
  });

  // Get Movie Detail
  @GET('/movie/{movie_id}')
  Future<MovieDetailResponse> getMovieDetail(
    @Query('api_key') String apiKey,
    @Path('movie_id') int movieId,
  );

  // Get Similar Movies for movie
  @GET('/movie/{movie_id}/similar')
  Future<MovieResponse> getSimilarMovies(
    @Query('api_key') String apiKey,
    @Path('movie_id') int movieId,
    @Query('page') int page,
  );

  // Get Genres Movie
  @GET('/genre/movie/list')
  Future<GenreResponse> getGenres(@Query('api_key') String apiKey);

  // Get Movie by search with query
  @GET('/search/movie')
  Future<MovieResponse> search(
    @Query('api_key') String apiKey,
    @Query('query') String query,
  );

  // Get Treding Movies Week
  @GET('trending/movie/week')
  Future<MovieResponse> getTrendingMoviesForWeek(
      @Query('api_key') String apiKey);

  // Get Reviews for movie
  @GET('/movie/{movie_id}/reviews')
  Future<ReviewResponse> getReviewsForMovie(
    @Query('api_key') String apiKey,
    @Path('movie_id') int movieId,
    @Query('page') int page,
  );

  // Get Now Playing Movies
  @GET('/movie/now_playing')
  Future<MovieResponse> getNowPlayingMovies(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );

  // Get Upcoming Movies
  @GET('/movie/upcoming')
  Future<MovieResponse> getUpComingMovies(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );

  //Get cast list for movie
  @GET('/movie/{movie_id}/credits')
  Future<CastResponse> getCastListForMovie(
    @Query('api_key') String apiKey,
    @Path('movie_id') int movieId,
  );

  //Get movie recommendations
  @GET('/movie/{movie_id}/recommendations')
  Future<MovieResponse> getMovieRecommendations(
    @Query('api_key') String apiKey,
    @Path('movie_id') int movieId,
    @Query('page') int page,
  );
}
