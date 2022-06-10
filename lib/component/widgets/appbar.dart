import 'package:flutter/material.dart';

AppBar appBar(String title) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 24),
    ),
  );
}
