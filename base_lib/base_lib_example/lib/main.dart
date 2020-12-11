
import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';
import 'package:base_lib/base_lib.dart';// as BaseLib;

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

  @override
  void initState() {
    super.initState();

    dataList = getPageList();
  }

  @override
  Widget build(BuildContext context) {

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
        'title': 'yi',
        'height': 44,
        'callBack': (data) {
          for (int i = 0; i < 4; i++) {
            var r = NumExt.randomInt(0, 10);
            print(r);
          }
        }
      },
      {
        'title': 'er',
        'height': 44,
        'callBack': (data) {
          Util.showSnackBar(context, 'tap one $data');
        }
      },
      {
        'title': 'san',
        'height': '300',
        'callBack': (data) {
          print('tap one $data ${data.title} ${data.index.toString()} ');
        }
      }
    ];

    var modelList = JsonUtil.getObjectList<PageItem>(list, (v) => PageItem.fromJson(v));
    return modelList;
  }

  void _onFloatingButton() {}
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
//        height: (json['height'] as int).toDouble(),//NumUtil.getDoubleByValueStr(json['height']),
        height: NumExt.doubleValue(json['height']),
        callBack: json['callBack']
    );
  }
}
