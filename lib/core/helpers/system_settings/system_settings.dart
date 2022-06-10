import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemSettings {
  Future setSettings() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}
