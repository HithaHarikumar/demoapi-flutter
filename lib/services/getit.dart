import 'package:demolistapi/services/remote_services.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void serviceLocators(){
  locator.registerLazySingleton<DioServices>(() => DioServices());
}