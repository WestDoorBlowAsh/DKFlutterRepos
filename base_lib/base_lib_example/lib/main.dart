import 'package:base_lib/base_lib.dart'; // as BaseLib;
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Base Lib Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Base Lib Home Page'),
//      home: PageListDemo(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PageItem> dataList = [];

  ///
  void _onFloatingButton() async {
//    dataList = getPageList();
//
//    LogUtil.e(dataList);
    print('6666666');
    await LibGlobal.init(() {
      print('77777');
    });

    print('8888');
  }

  @override
  void initState() {
    super.initState();

    LogUtil.e('will initState');
    dataList = getPageList();

    LogUtil.e('initState');
  }

  @override
  Widget build(BuildContext context) {
    LogUtil.e('build');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: bodyWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFloatingButton,
        tooltip: 'onFloat',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget bodyWidget() {
    return ListView.builder(
      itemCount: dataList.length,
//      itemExtent: 44,   // 固定高度
      itemBuilder: (BuildContext context, int index) {
        var model = dataList[index];
        return GestureDetector(
          child: Container(
            height: model.height,
            child: Center(child: Text(model.title)),
            color: ColorsExt.random(),
          ),
          onTap: () {
            model.index = index;
            model.callBack(model);
          },
        );
      },
    );
  }

  Widget onItemBuilder(BuildContext context, int index) {
    var model = dataList[index];
    return GestureDetector(
      child: Container(
        height: model.height,
        child: Center(child: Text(model.title)),
        color: ColorsExt.random(),
      ),
      onTap: () {
        model.index = index;
        model.callBack(model);
      },
    );
  }

  List<PageItem> getPageList() {
    var list = [
      {
        'title': '随机数',
        'height': 44,
        'callBack': (data) {
          for (int i = 0; i < 4; i++) {
            var r = NumExt.randomInt(0, 10);
            print(r);
          }
        }
      },
      {
        'title': '提示框 SnackBar',
        'height': 44,
        'callBack': (data) {
          Util.showSnackBar(context, 'tap one $data');
        }
      },
      {
        'title': 'json 里数据格式转换 double 出错',
        'height': Object(),
        'callBack': (data) {
          var height = 1238;
          // var model = NumExt.doubleValue(height, defValue: 50);
          var model = NumExt.numValue<double>(height);
          // model = height?.toDouble() ?? 1230;
          print('ok $model');
        }
      }
    ];

    var modelList =
        JsonUtil.getObjectList<PageItem>(list, (v) => PageItem.fromJson(v));
    return modelList;
  }
}

class PageItem {
  String title;
  Function callBack;
  int index;
  double height;

  PageItem({this.title, this.callBack, this.index, this.height});

  factory PageItem.fromJson(Map<String, dynamic> json) {
    return PageItem(
        title: json['title'],
        index: json['index'],
//        height: NumExt.doubleValue(json['height'], defValue: 50),
        height: NumExt.numValue<double>(json['height'], defValue: 50),
        callBack: json['callBack']);
  }
}
