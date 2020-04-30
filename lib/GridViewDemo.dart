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
    scrollController.addListener((){
      print("scrollController.offset：+${scrollController.offset}");
      print("scrollController.position：+${scrollController.position}");
    });
    return GridView(
      scrollDirection: Axis.vertical,
      reverse: false,
      controller: scrollController,
//      primary: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //横轴三个子widget
          childAspectRatio: 1.3 //宽高比为1
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
