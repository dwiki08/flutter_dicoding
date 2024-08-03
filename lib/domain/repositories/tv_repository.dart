import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv.dart';

abstract class TvRepository {
  Future<Either<Failure, List<Tv>>> getNowPlayingTv();

  Future<Either<Failure, List<Tv>>> getPopularTv();

  Future<Either<Failure, List<Tv>>> getTopRatedTv();

  Future<Either<Failure, Tv>> getTvDetail(int id);

  Future<Either<Failure, List<Tv>>> getTvRecommendations(int id);

  Future<Either<Failure, List<Tv>>> searchTv(String query);

  Future<Either<Failure, String>> saveWatchlist(Tv movie);

  Future<Either<Failure, String>> removeWatchlist(Tv movie);

  Future<bool> isAddedToWatchlist(int id);

  Future<Either<Failure, List<Tv>>> getWatchlistTv();
}
