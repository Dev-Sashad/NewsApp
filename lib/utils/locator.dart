import 'package:get_it/get_it.dart';
import 'package:newsapp/core/services/newSevices.dart';
import 'package:newsapp/utils/progressBarManager/dialogService.dart';
import 'package:newsapp/utils/router/navigationService.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ProgressService());
  locator.registerLazySingleton(() => News());
  locator.registerLazySingleton(() => CategoryNews());
  locator.registerLazySingleton(() => OtherNews());
}
