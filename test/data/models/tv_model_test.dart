import 'package:ditonton/data/models/tv_model.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tvModel = TvModel(
      adult: false,
      backdropPath: '/path',
      genreIds: [1],
      id: 2637,
      originCountry: ['GB'],
      overview: "Amateur chefs.",
      popularity: 3539.203,
      posterPath: "/poster",
      firstAirDate: "2005-01-10",
      name: "Come Dine with Me",
      voteAverage: 4.8,
      voteCount: 29);

  final tv = Tv(
      adult: false,
      backdropPath: '/path',
      genreIds: [1],
      id: 2637,
      overview: "Amateur chefs.",
      popularity: 3539.203,
      posterPath: "/poster",
      firstAirDate: "2005-01-10",
      name: "Come Dine with Me",
      voteAverage: 4.8,
      voteCount: 29);

  test('should be a subclass of Movie entity', () async {
    final result = tvModel.toEntity();
    expect(result, tv);
  });
}
