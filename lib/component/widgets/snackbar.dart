import 'package:flutter/material.dart';
import '../../core/core_shelf.dart';

void snackbar(String message) {
  ScaffoldMessenger.of(GlobalVars.context!).showSnackBar(SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 2),
    dismissDirection: DismissDirection.horizontal,
  ));
}
