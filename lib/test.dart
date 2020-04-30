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
    return NestedScrollView(
      scrollDirection: Axis.vertical,
      reverse:false,
      body: Column(
        children: <Widget>[],
      ),
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
