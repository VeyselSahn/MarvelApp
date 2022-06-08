import '../../core_shelf.dart';

class GlobalVars {
  static var apiService = getIt<ApiService>();
  static var navigationService = getIt<NavigationService>();
  static var context = getIt<NavigationService>().navigatorKey.currentContext;
}
