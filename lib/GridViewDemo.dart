import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GridViewDemoState();
  }
}

class GridViewDemoState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GridView'),
        ),
        body: GridViewDemoStatefulWidget());
  }
}

class GridViewDemoStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GridViewState();
  }
}

class GridViewState extends State {
  @override
  Widget build(BuildContext context) {
    return GridView(
      scrollDirection: Axis.vertical,
      reverse: false,
      controller: scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //横轴三个子widget
          childAspectRatio: 1.0 //宽高比为1时
          ),
//      semanticChildCount: 5,
      children: <Widget>[
        Container(
          color: Colors.blue[300],
          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
          width: 70,
          height: 70,
        ),
        Container(
          color: Colors.blue[300],
          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
          width: 70,
          height: 70,
        ),
        Container(
          color: Colors.blue[300],
          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
          width: 70,
          height: 70,
        ),
        Container(
          color: Colors.blue[300],
          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
          width: 70,
          height: 70,
        ),
        Container(
          color: Colors.blue[300],
          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
          width: 70,
          height: 70,
        ),
        Container(
          color: Colors.blue[300],
          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
          width: 70,
          height: 70,
        ),
        Container(
          color: Colors.blue[300],
          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
          width: 70,
          height: 70,
        ),
        Container(
          color: Colors.blue[300],
          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
          width: 70,
          height: 70,
        ),
        Container(
          color: Colors.blue[300],
          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
          width: 70,
          height: 70,
        ),
      ],
    );
  }

  ScrollController scrollController = new ScrollController();
}
