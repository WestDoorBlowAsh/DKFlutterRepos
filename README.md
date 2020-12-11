# DKFlutterRepos


## [base_lib](base_lib) 
Flutter 基础组件库，方便多个项目公用。
1. 目录结构
>- |--lib
>    - |-- common (常用类，例如常量例如常量Constant)
>    - |-- data (网络数据层，DioUtil，BaseResp)
>    - |-- res (资源文件，string，colors，dimens，styles)
>    - |-- ui (界面相关，page，dialog，widgets)
>    - |-- util (工具类，VersionUtil)

2. Dependencies
```
dependencies:

    flutter 环境
    Flutter 1.25.0-5.0.pre.91 • channel master •
    https://github.com/flutter/flutter.git
    Framework • revision 7dade22f25 (5 days ago) • 2020-12-06 21:34:04 +0530
    Engine • revision 6491c7518f
    Tools • Dart 2.12.0 (build 2.12.0-120.0.dev)

    dio: ^3.0.10

    flustars: ^0.3.3
    # flustars v0.2.6 版本起依赖common_utils。无需再次添加。
    # common_utils: '1.2.1'

    fluintl: '>=0.1.3 <1.0.0'
  
```
将 dio，flustars 引用最新的了，copy code from
https://github.com/Sky24n/FlutterRepos

