import 'package:dicoding_flutter/data/local/database/app_database.dart';
import 'package:dicoding_flutter/data/local/local_data_source.dart';
import 'package:dicoding_flutter/data/remote/remote_data_source.dart';
import 'package:dicoding_flutter/data/remote/service/api_service.dart';
import 'package:dicoding_flutter/data/remote/service/chopper_client.dart';
import 'package:get_it/get_it.dart';
import 'package:dicoding_flutter/data/local/dao/restaurant_dao.dart';

final getIt = GetIt.instance;

void setupInjection() {
  getIt.registerSingletonAsync<RestaurantDao>(() async {
    final db = AppDatabase();
    return RestaurantDao(db);
  });

  getIt.registerSingleton<ApiService>(chopperClient.getService<ApiService>());

  getIt.registerSingleton<RemoteDataSource>(RemoteDataSource());

  getIt.registerSingleton<LocalDataSource>(LocalDataSource());
}
