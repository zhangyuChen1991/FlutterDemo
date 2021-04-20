import 'package:first_flutter_app/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseWidgetDemo4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BaseWidgetDemo4State();
  }
}

class BaseWidgetDemo4State extends State<BaseWidgetDemo4> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'aaa',
      home: Scaffold(
        appBar: AppBar(
          title: Text('基础控件'),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.blue[200],
            child: ListView(
              children: <Widget>[
                DrawerHeader(),
                ListTile(title: Text('item1'),),
                ListTile(title: Text('item2'),),
                ListTile(title: Text('item3'),),
                ListTile(title: Text('close drawer'),onTap: (){
                },)
              ],
            ),
          ),
          semanticLabel: 'label',
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(title: Text('close drawer'),onTap: (){
              print('open Drawer'); //打日志到控制台)
            },),
            RaisedButton(
              child: Text('open Drawer'),
              onPressed: (){
                Scaffold.of(context).openDrawer();
                WidgetUtils.showToast('Open drawer');
                print('open Drawer'); //打日志到控制台)

              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 1,
              color: Colors.white,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text('DrawerHeader'),
          ),
        ],
      )
    );
  }

}