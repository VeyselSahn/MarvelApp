import 'package:get_it/get_it.dart';
import '../../../component/component_shelf.dart';

import '../../core_shelf.dart';

var getIt = GetIt.instance;

class Locators {
  static final instance = Locators();

  void setUpLocators() {
    getIt.registerLazySingleton(() => ApiService());
    getIt.registerLazySingleton(() => NavigationService());
    getIt.registerLazySingleton(() => ServiceConsant());
  }
}
