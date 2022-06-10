import 'package:flutter/material.dart';
import 'package:path_task/core/core_shelf.dart';

Center loadingWidget() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Loading',
          style: Theme.of(GlobalVars.context!).textTheme.subtitle1,
        )
      ],
    ),
  );
}
