import 'package:base_lib/base_lib.dart';
import 'package:flutter/material.dart';
import 'dart:math';

// 扩展现有类功能

extension NumExt on NumUtil {

  // 随机数 int [min, max]
  static int randomInt(int min, int max) {
    return Random().nextInt(max+1) + min;
  }

  // 从 string, int 获取 double
  static double doubleValue(value, {double defValue = 0}) {
    double res = defValue;
    try {
      res = value.toDouble();
      if (value is String) {
        res = NumUtil.getDoubleByValueStr(value, defValue: defValue);
      }
    } catch (e) {
      print("NumExt doubleValue error, Exception：${e.toString()}");
    }
    return res;
  }
}

extension ColorsExt on Colors {

  // 随机颜色
  static Color random() =>
      Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
}




