// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      json['name'] as String,
      json['id'] as int,
      json['logo_path'] as String?,
      json['origin_country'] as String,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'logo_path': instance.logo,
      'origin_country': instance.country,
    };
