import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/core_shelf.dart';
import 'core/helpers/system_settings/system_settings.dart';
import 'screen/home_page/view/home_screen.dart';

void main() async {
  WidgetsFlutterBinding();
  Locators.instance.setUpLocators();
  await SystemSettings().setSettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Marvel App',
        navigatorKey: GlobalVars.navigationService.navigatorKey,
        theme: defaultTheme,
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
