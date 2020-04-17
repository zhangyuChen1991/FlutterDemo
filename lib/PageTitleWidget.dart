import 'package:flutter/material.dart';

void main() {
  runApp(new PageTitleStatefulWidget("Flutter"));
}

class PageTitleStatefulWidget extends StatefulWidget {
  String titleText = "Flutter";

  PageTitleStatefulWidget(String title){
    this.titleText = title;
  }
  @override
  State<StatefulWidget> createState() {
    PageTitleState state = new PageTitleState();
    return state;
  }
}

class PageTitleState extends State<PageTitleStatefulWidget> {
  @override
  PageTitleStatefulWidget get widget => super.widget;

  @override
  Widget build(BuildContext context) {
    return new Container(
      //第二层布局，高度100，宽度充满父布局
      decoration: BoxDecoration(
          //背景装饰
          gradient: RadialGradient(
              //背景径向渐变
              colors: [Colors.blue[200], Colors.blue[600]],
              center: Alignment.topLeft,
              radius: 8),
          boxShadow: [
            //卡片阴影
            BoxShadow(
                color: Colors.blue[100],
                offset: Offset(5.0, 5.0),
                blurRadius: 7.0)
          ]),
      height: 100,
      padding: EdgeInsets.fromLTRB(20.0, 10, 20, 10),
      margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
      alignment: Alignment(-1, 1),
      //左下方(0,0是中心，-1位左和上，1为右和下，具体看源码)
      child: Text(widget.titleText,
          style: new TextStyle(
              color: Color(0xFF0000CD),
              fontStyle: FontStyle.normal,
              fontSize: 15)),
    );
  }
}
