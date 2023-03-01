import 'package:favin_test/base/api/api.dart';
import 'package:favin_test/base/api/http_api.dart';
import 'package:favin_test/model/data_source/class/class_local_source.dart';
import 'package:favin_test/model/data_source/class/class_remote_source.dart';
import 'package:favin_test/model/repository/class/class_repository.dart';
import 'package:favin_test/model/repository/class/class_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

GetIt locator = GetIt.instance;

Future<void> setup() async {
  locator.registerSingleton<GetStorage>(GetStorage());
  locator.registerSingleton<AppApi>(HttpApi());

  locator.registerLazySingleton<ClassLocalSource>(
      () => ClassLocalSource(locator()));
  locator.registerLazySingleton<ClassRemoteSource>(
      () => ClassRemoteSource(locator()));
  locator.registerLazySingleton<ClassRepository>(() => ClassRepositoryImpl(
      localSource: locator<ClassLocalSource>(),
      remoteSource: locator<ClassRemoteSource>()));
}
