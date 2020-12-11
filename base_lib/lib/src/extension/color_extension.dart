import 'package:flutter/material.dart';
import 'dart:math';

// 扩展现有类功能
extension DKColors on Colors {

  static Color randomColor() =>
      Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);

}
