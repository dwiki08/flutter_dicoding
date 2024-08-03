import 'package:ditonton/domain/entities/tv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_model.freezed.dart';
part 'tv_model.g.dart';

@freezed
class TvModel with _$TvModel {
  const factory TvModel({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    List<String>? originCountry,
    String? overview,
    double? popularity,
    String? posterPath,
    String? firstAirDate,
    String? name,
    double? voteAverage,
    int? voteCount,
  }) = _TvModel;

  factory TvModel.fromJson(Map<String, dynamic> json) =>
      _$TvModelFromJson(json);

  const TvModel._();

  Tv toEntity() {
    return Tv(
      adult: adult,
      backdropPath: backdropPath,
      genreIds: genreIds,
      id: id ?? 0,
      name: name ?? '',
      overview: overview ?? '',
      posterPath: posterPath ?? '',
      popularity: popularity,
      firstAirDate: firstAirDate,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
