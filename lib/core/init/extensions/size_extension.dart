import 'package:flutter/cupertino.dart';

extension SizeExtension on BuildContext {
  Size get deviceSize => MediaQuery.of(this).size;
  double get deviceWidth => deviceSize.width;
  double get deviceHeight => deviceSize.height;
}
