import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tGenreModel = GenreModel(id: 0, name: 'genre');
  final tGenre = Genre(id: 0, name: 'genre');

  test('should be a subclass of Movie entity', () async {
    final result = tGenreModel.toEntity();
    expect(result, tGenre);
  });
}
