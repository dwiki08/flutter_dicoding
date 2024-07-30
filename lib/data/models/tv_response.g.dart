// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file


part of 'tv_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TvResponseImpl _$$TvResponseImplFromJson(Map<String, dynamic> json) =>
    _$TvResponseImpl(
      page: (json['page'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => TvModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      totalResults: (json['total_results'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TvResponseImplToJson(_$TvResponseImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
