import 'dart:convert';

import 'package:ditonton/data/models/tv_model.dart';
import 'package:ditonton/data/models/tv_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json_reader.dart';

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
      voteCount: 29
  );

  final tvResponse = TvResponse(page: 1, results: [tvModel], totalPages: 10, totalResults: 100);

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
      json.decode(readJson('dummy_data/tv_list.json'));
      // act
      final result = TvResponse.fromJson(jsonMap);
      // assert
      expect(result, tvResponse);
    });
  });
}