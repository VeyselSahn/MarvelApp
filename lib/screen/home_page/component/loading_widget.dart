import 'package:flutter/material.dart';

Center loadingWidget() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(color: Colors.red.shade800),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Loading',
          style: TextStyle(color: Colors.red.shade800, fontSize: 20, fontWeight: FontWeight.w600),
        )
      ],
    ),
  );
}
