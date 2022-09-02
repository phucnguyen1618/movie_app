import 'package:data_api/models/movie/review/review.dart';
import 'package:data_api/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_response.g.dart';

@JsonSerializable()
class ReviewResponse extends BaseResponse {
  int id;
  @JsonKey(name: 'results')
  List<Review> reviews;

  ReviewResponse(
    int page,
    int totalResults,
    int totalPages,
    this.id,
    this.reviews,
  ) : super(page, totalResults, totalPages);

  factory ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ReviewResponseToJson(this);
}
