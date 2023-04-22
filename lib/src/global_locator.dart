import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'bloc/auth/auth_bloc.dart';

late GetIt global;

void setUpGlobalLocator() {
  global = GetIt.I;
  global.registerLazySingleton(() => Logger());
  global.registerLazySingleton<AuthBloc>(() => AuthBloc());
}
