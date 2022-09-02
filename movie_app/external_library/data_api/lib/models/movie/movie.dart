import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey(name: 'poster_path')
  String? poster;
  bool adult;
  String overview;
  @JsonKey(name: 'release_date')
  String date;
  @JsonKey(name: 'genre_ids')
  List<int> genreIds;
  int id;
  @JsonKey(name: 'original_title')
  String originalTitle;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  String title;
  @JsonKey(name: 'backdrop_path')
  String? backdrop;
  double popularity;
  @JsonKey(name: 'vote_count')
  int voteCount;
  @JsonKey(name: 'vote_average')
  double voteAverage;

  Movie(
    this.poster,
    this.adult,
    this.overview,
    this.date,
    this.genreIds,
    this.id,
    this.originalTitle,
    this.originalLanguage,
    this.title,
    this.backdrop,
    this.popularity,
    this.voteCount,
    this.voteAverage,
  );

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);

  
}
