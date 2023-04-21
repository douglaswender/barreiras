import 'package:barreiras/src/pages/home/home_store.dart';
import 'package:get_it/get_it.dart';

class Injection {
  static final getIt = GetIt.instance;

  static void setup() {
    getIt.registerLazySingleton<HomeStore>(
      () => HomeStore(),
    );
  }
}
