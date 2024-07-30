import 'package:ditonton/data/models/movie_table.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tMovieTable = MovieTable(
      id: 0,
      title: 'title',
      posterPath: 'posterPath',
      overview: 'overview',
      isTv: 0);
  final jsonMovieTable = {
    'id': 0,
    'title': 'title',
    'posterPath': 'posterPath',
    'overview': 'overview',
    'isTv': 0,
  };

  test('should return json of MovieTable', () async {
    final result = tMovieTable.toJson();
    expect(result, jsonMovieTable);
  });
}
