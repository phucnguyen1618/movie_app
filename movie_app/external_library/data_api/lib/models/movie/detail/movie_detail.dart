import 'package:data_api/models/company/company.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../genre/genre.dart';

part 'movie_detail.g.dart';

@JsonSerializable()
class MovieDetail {
  bool adult;
  @JsonKey(name: 'backdrop_path')
  String? backdrop;
  int budget;
  List<Genre> genres;
  int id;
  @JsonKey(name: 'original_title')
  String originalTitle;
  String? overview;
  double popularity;
  @JsonKey(name: 'poster_path')
  String? poster;
  @JsonKey(name: 'production_companies')
  List<Company> companies;
  @JsonKey(name: 'release_date')
  String date;
  int revenue;
  int? runtime;
  String status;
  String title;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'vote_count')
  int voteCount;

  MovieDetail(
    this.adult,
    this.backdrop,
    this.budget,
    this.genres,
    this.id,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.poster,
    this.companies,
    this.date,
    this.revenue,
    this.runtime,
    this.status,
    this.title,
    this.voteAverage,
    this.voteCount,
  );

  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);
}
