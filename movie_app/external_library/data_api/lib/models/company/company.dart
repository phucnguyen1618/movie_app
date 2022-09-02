import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
  String name;
  int id;
  @JsonKey(name: 'logo_path')
  String? logo;
  @JsonKey(name: 'origin_country')
  String country;

  Company(
    this.name,
    this.id,
    this.logo,
    this.country,
  );

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
