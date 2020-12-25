import 'dart:math';

import 'package:base_lib/base_lib.dart';
import 'package:flutter/material.dart';

// 扩展现有类功能

// extension NumExt on NumUtil {

extension NumExt on NumUtil {
  // 随机数 int [min, max]
  static int randomInt(int min, int max) {
    return Random().nextInt(max + 1) + min;
  }

  // 从 string, int 获取 double
  static double doubleValue(value, {double defValue = 0.0}) {
    double res = defValue;
    try {
      res = value.toDouble();
    } on NoSuchMethodError catch (e, stack) {
      if (value is String) {
        res = NumUtil.getDoubleByValueStr(value, defValue: defValue);
      } else {
        var message = "NumExt doubleValue error, Exception：${e.toString()}.";
        print("$message");
        print("$stack");
        if (LibGlobal.libErrorRethrow) {
          throw e;
        }
      }
    }
    return res;
  }

  static T numValue<T>(value, {T defValue}) {
    var res = defValue ?? 0;
    // var type = T is dynamic ? value.runtimeType : T;


    try {


      switch (T) {
        case double:
          res = value.toDouble();
          break;
        case int:
          res = value.toInt();
          break;
        case String:
          break;
        default: {
          print("default numValue");
        }
      }


    } on NoSuchMethodError catch (e, stack) {

      var message = "numValue error, Exception：${value}.";
      print("$message");
      if (LibGlobal.libErrorRethrow) {
        throw e;
      }
    }


    return res;
  }
}

extension ColorsExt on Colors {
  // 随机颜色
  static Color random() => Color.fromRGBO(
      Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
}
