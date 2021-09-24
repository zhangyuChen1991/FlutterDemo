import 'package:first_flutter_app/BaseWidget1.dart';
import 'package:first_flutter_app/BaseWidget2.dart';
import 'package:first_flutter_app/PopWindowDemoPage.dart';
import 'package:first_flutter_app/TableDemo.dart';
import 'package:first_flutter_app/DialogDemo.dart';
import 'package:first_flutter_app/LayoutWidget.dart';
import 'package:first_flutter_app/ListViewDemo.dart';
import 'package:first_flutter_app/ui/qqmusic/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'BaseWidget4.dart';

class WidgetMenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WidgetMenuPageState();
  }
}

class WidgetMenuPageState extends State<WidgetMenuPage> {
  List menus = [
    'Text/Image/Button/TextFiled',
    'Slider/Checkbox/Radio/Switch',
    'Container/Row/Clumn/Stack/Wrap',
    'Table/ListView/GridView',
    'Scrollable/SingleChildScrollView/NestedScrollView',
    'SimpleDialog/AlertDialog/BottomSheet',
    'Drawer/Appbar/BottomNavigationBar/TabBar',
    'ListView',
    'PopWindow',
    'QQ音乐主页',
    ''
  ];
  //Offstage

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection:Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 60,
              alignment: Alignment(-1, 0),
              padding: EdgeInsets.fromLTRB(5, 5, 20, 5),
              child: FlatButton(
                  onPressed: () {
                    switch (index){
                      case 0:{
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => new BaseWidgetDemo1()));
                      }
                      break;
                      case 1:{
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => new BaseWidgetDemo2()));
                      }
                      break;
                      case 2:{
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => new LayoutStafulWidget()));
                      }
                      break;
                      case 3:{
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => new BaseWdiget3StatefulWidget()));
                      }
                      break;
                      case 5:{
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => new DialogDemoPage()));
                      }
                      break;
                      case 6:{
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => new BaseWidgetDemo4()));
                      }
                      break;
                      case 7:{
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => new ListStatefulWedgit()));
                      }
                      break;
                      case 8:{
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => new PopWindowDemoPage()));
                      }
                      break;
                      case 9:{
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => new HomePage()));
                      }
                      break;
                    }
                  },
                  //Navigator.push(context,new MaterialPageRoute(builder: (context) => new BaseWidgetDemo1()))
                  child: Text(menus[index],
                      style:
                          TextStyle(color: Color(0xff263138), fontSize: 16))));
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: 1,
            color: Color(0xffe2e8ed),
          );
        },
        itemCount: menus.length);
  }
}
