import 'package:json_annotation/json_annotation.dart';

import '../../models/genre/genre.dart';

part 'genre_response.g.dart';

@JsonSerializable()
class GenreResponse {
  List<Genre> genres;

  GenreResponse(this.genres);

  factory GenreResponse.fromJson(Map<String, dynamic> json) => _$GenreResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GenreResponseToJson(this);
}