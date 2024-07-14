import 'package:dicoding_flutter/data/local/database/database.dart';
import 'package:dicoding_flutter/data/local/local_data_source.dart';
import 'package:dicoding_flutter/data/remote/remote_data_source.dart';
import 'package:dicoding_flutter/data/remote/service/api_service.dart';
import 'package:dicoding_flutter/data/remote/service/chopper_client.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupInjection() {
  getIt.registerSingletonAsync(() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('your_foods.db').build();
    return database.restaurantDao;
  });

  getIt.registerSingleton<ApiService>(chopperClient.getService<ApiService>());

  getIt.registerSingleton<RemoteDataSource>(RemoteDataSource());

  getIt.registerSingleton<LocalDataSource>(LocalDataSource());
}
