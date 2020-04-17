import 'package:first_flutter_app/WidgetMenuList.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      home: new Scaffold (
        appBar: new AppBar(
          title: new Text('基础控件'),
        ),
        body: WidgetMenuPage(),
      ),
    );
  }
}
