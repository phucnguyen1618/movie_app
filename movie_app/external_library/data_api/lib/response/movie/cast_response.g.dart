// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastResponse _$CastResponseFromJson(Map<String, dynamic> json) => CastResponse(
      json['id'] as int,
      (json['cast'] as List<dynamic>)
          .map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CastResponseToJson(CastResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.castList,
    };
