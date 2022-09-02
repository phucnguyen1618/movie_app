import 'package:data_api/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../models/movie/movie.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse extends BaseResponse {
  @JsonKey(name: 'results')
  List<Movie>? movies;

  MovieResponse(
    int page,
    int totalResults,
    int totalPages,
    this.movies,
  ) : super(page, totalResults, totalPages);

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}
