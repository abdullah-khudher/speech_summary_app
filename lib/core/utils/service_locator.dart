import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../Features/Home/data/repos/home_repo.dart';
import '../../Features/Home/data/repos/home_repo_impl.dart';
import '../../Features/Home/data/services/speech_service.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));
  getIt.registerLazySingleton<HomeRepo>(
        () => HomeRepoImpl(getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton(() => SpeechService());
}
