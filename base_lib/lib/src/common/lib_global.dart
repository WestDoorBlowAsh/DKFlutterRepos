import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flustars/flustars.dart';

typedef VoidCallback1 = void Function();

class LibGlobal {
  /// lib 库中的 error 是否重新抛出
  ///
  /// true 重新抛出 (建议重新抛出, 及时处理掉错误).
  /// false 时 发生错误不会影响主项目
  static const bool libErrorRethrow = false;

}
