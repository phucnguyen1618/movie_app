import 'package:data_api/models/movie/detail/movie_detail.dart';

class MovieDetailResponse {
  MovieDetail movieDetail;

  MovieDetailResponse(this.movieDetail);

  MovieDetailResponse.fromJson(Map<String, dynamic> json)
      : movieDetail = MovieDetail.fromJson(json);
}
