import 'package:first_flutter_app/BaseWidget1.dart';
import 'package:first_flutter_app/BaseWidget2.dart';
import 'package:first_flutter_app/LayoutWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetMenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WidgetMenuPageState();
  }
}

class WidgetMenuPageState extends State<WidgetMenuPage> {
  List menus = [
    'Text/Image/Button/TextFiled',
    'Slider/Checkbox/Radio/Switch',
    'Container/Row/Clumn/Stack/Wrap',
    'Table/ListView/Flow',
    'Scrollable/SingleChildScrollView/NestedScrollView/GridView',
    'SimpleDialog/AlertDialog/BottomSheet',
    'Appbar/BottomNavigationBar/TabBar',
    'Drawer',
    ''
  ];
  //Offstage

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
