import 'dart:math';

import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';
import 'package:base_lib/base_lib.dart';// as BaseLib;

void main() {
  print('runApp ${DateTime.now()}');

  var app = MyApp();

  print('app ${DateTime.now()}');

  runApp(app);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('MyApp ${DateTime.now()}');

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
  _MyHomePageState createState() {
    print('_MyHomePageState ${DateTime.now()}');

    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {

  List<PageItem> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    list = getPageList();
    print('initState ${DateTime.now()}');
  }

  @override
  Widget build(BuildContext context) {

    print('build ${DateTime.now()}');

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
    print('run bodywidget ${DateTime.now()}');
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        var model = list[index];
        return GestureDetector(
          child: Container(
            child: Text(model.title),
            height: 44,
            color: Util.randomColor(),
          ),
          onTap: () {
            model.index = index;
            model.callBack(model);
          },
        );
      },
    );
  }

  List<PageItem> getPageList() {
    var list = [
      {
        'title': 'yi',
        'callBack': (data) {
          print('tap one');
        }
      },
      {
        'title': 'er',
        'callBack': (data) {
          print('tap one $data');
        }
      },
      {
        'title': 'san',
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
  int index;
  Function callBack;

  PageItem({this.title, this.callBack, this.index});

  factory PageItem.fromJson(Map<String, dynamic> json) {
    return PageItem(
        title: json['title'],
        index: json['index'],
        callBack: json['callBack']
    );
  }
}
