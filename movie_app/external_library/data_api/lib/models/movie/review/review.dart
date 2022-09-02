import 'package:data_api/models/movie/detail/author_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  String author;
  @JsonKey(name: 'author_details')
  AuthorDetail authorDetail;
  String content;
  @JsonKey(name: 'created_at')
  String createAt;
  String id;
  @JsonKey(name: 'updated_at')
  String updateAt;
  String url;

  Review(
    this.author,
    this.authorDetail,
    this.content,
    this.createAt,
    this.id,
    this.updateAt,
    this.url,
  );

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
