import 'package:ditonton/data/models/tv_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_response.freezed.dart';
part 'tv_response.g.dart';

@freezed
class TvResponse with _$TvResponse {
  const factory TvResponse({
    int? page,
    List<TvModel>? results,
    int? totalPages,
    int? totalResults,
  }) = _TvResponse;

  factory TvResponse.fromJson(Map<String, dynamic> json) =>
      _$TvResponseFromJson(json);
}
