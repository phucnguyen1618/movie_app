import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable()
class Cast {
  bool adult;
  int? gender;
  int id;
  @JsonKey(name: 'known_for_department')
  String knownForDepartment;
  String name;
  @JsonKey(name: 'original_name')
  String originalName;
  double popularity;
  @JsonKey(name: 'profile_path')
  String? profile;
  @JsonKey(name: 'cast_id')
  int castId;
  String character;
  @JsonKey(name: 'credit_id')
  String creditId;
  int order;

  Cast(
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profile,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  );

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
  Map<String, dynamic> toJson() => _$CastToJson(this);
}
