import 'package:get_it/get_it.dart';
import 'package:spotify_clone/src/core/services/system_ui_service.dart';

final locator = GetIt.instance;

T gx<T extends Object>() => locator.get();

void injectServices() {
  locator.registerLazySingleton(() => SystemUIService());
}
