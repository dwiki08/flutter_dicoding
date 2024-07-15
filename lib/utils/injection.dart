import 'package:dicoding_flutter/data/local/local_data_source.dart';
import 'package:dicoding_flutter/data/remote/remote_data_source.dart';
import 'package:dicoding_flutter/data/remote/service/api_service.dart';
import 'package:dicoding_flutter/data/remote/service/chopper_client.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupInjection() {
  getIt.registerSingleton<LocalDataSource>(LocalDataSource());

  getIt.registerSingleton<ApiService>(chopperClient.getService<ApiService>());

  getIt.registerSingleton<RemoteDataSource>(RemoteDataSource());
}
