import 'package:path_task/component/component_shelf.dart';

import '../../core_shelf.dart';

class GlobalVars {
  static var apiService = getIt<ApiService>();
  static var navigationService = getIt<NavigationService>();
  static var context = getIt<NavigationService>().navigatorKey.currentContext;
  static var serviceConst = getIt<ServiceConsant>();
}
