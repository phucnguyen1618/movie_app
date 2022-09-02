import 'package:data_api/models/movie/keyword/keyword.dart';
import 'package:json_annotation/json_annotation.dart';

part 'keyword_response.g.dart';

@JsonSerializable()
class KeywordResponse {
  int id;
  List<Keyword> keywords;

  KeywordResponse(this.id, this.keywords);

  factory KeywordResponse.fromJson(Map<String, dynamic> json) =>
      _$KeywordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$KeywordResponseToJson(this);
}
