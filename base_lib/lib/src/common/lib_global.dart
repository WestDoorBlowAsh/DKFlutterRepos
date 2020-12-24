import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flustars/flustars.dart';

class LibGlobal {
  /// lib 库中的 error 是否重新抛出
  ///
  /// true 重新抛出 (建议重新抛出, 及时处理掉错误).
  /// false 时 发生错误不会影响主项目
  static const bool libErrorRethrow = false;


  //初始化全局信息
  static Future init(VoidCallback callback) async {
    WidgetsFlutterBinding.ensureInitialized();

    await initSpUtil();

    callback();

    if (Platform.isAndroid) {
      // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
      SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  static Future initSpUtil() async {
    var res = await SpUtil.getInstance();
    return res;
  }
}
