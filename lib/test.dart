import 'package:flutter/material.dart';

void main() {
  runApp(new PageTitleStatefulWidget("Flutter"));
}

class PageTitleStatefulWidget extends StatefulWidget {
  String titleText = "Flutter";

  PageTitleStatefulWidget(String title) {
    this.titleText = title;
  }

  @override
  State<StatefulWidget> createState() {
    PageTitleState state = new PageTitleState();
    return state;
  }
}

class PageTitleState extends State<PageTitleStatefulWidget> {
  var rating;
  double rating1 = 0;
  String checkBoxOn = "checkBoxOff";
  var checkBoxChecked = false;
  String radioSelectedPosition;

  bool switchOn = false;

  String imageUrl;

  @override
  PageTitleStatefulWidget get widget => super.widget;

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: Colors.deepOrange[300],
      activeTrackColor: Colors.deepOrange[600],
      inactiveTrackColor: Colors.blue[300],
      inactiveThumbColor: Colors.blue[100],
      inactiveThumbImage: NetworkImage(imageUrl),
      value: switchOn,
      onChanged: (switchOn) {
        setState(() {
          this.switchOn = switchOn;
          print('switchOn: ${switchOn}'); //打日志到控制台)
        });
      },
    );
  }
}

class DemoStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit:StackFit.loose,
      alignment: AlignmentDirectional.center,
      textDirection: TextDirection.ltr,
      overflow: Overflow.clip,
      children: <Widget>[
        Container(width: 120,height: 120,color: Colors.cyan[200],),
        Container(width: 90,height: 90,color: Colors.cyan[400],),
        Container(width: 60,height: 60,color: Colors.cyan[600],),
        Positioned(left: 100,top: 100,child: Container(width: 120,height: 120,color: Colors.cyan[800],),)//指定位置，超出stack范围，测试overflow属性
      ],
    );
  }
}

TextEditingController editController = new TextEditingController();

class DemoStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DemoState();
  }
}

class DemoState extends State<DemoStatefulWidget> {
  var data;

  @override
  Widget build(BuildContext context) {
    return Text(data);
  }

  void onDataChanged(newData) {
    setState(() {
      data = newData;
    });
  }
}
