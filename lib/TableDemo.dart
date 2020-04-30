import 'package:first_flutter_app/GridViewDemo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver.dart';
import 'package:flutter/src/rendering/sliver_grid.dart';

class BaseWdiget3StatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BaseWdiget3State();
  }
}

class BaseWdiget3State extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Table'),
        ),
        body: Column(
          children: <Widget>[
            TableDemoStatefulWidget(),
            Container(
              margin: EdgeInsets.fromLTRB(0, 40, 0, 40),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Container(
                        color: Colors.black,
                        height: 1,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text('我是分割线'),
                      ),
                      Container(
                        color: Colors.black,
                        height: 1,
                      ),
                    ],
                  ),
                ],
                columnWidths: {0: FlexColumnWidth(2), 2: FlexColumnWidth(2)},
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              ),
            ),
            RaisedButton(
              child: Text('go to GridView page'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => new GridViewDemo()));
              },
            ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 40, 0, 40),
        child: Text('ListView请参考目录页面',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),)
          ],
        ));
  }
}

class TableDemoStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TableDemoState();
  }
}

class TableDemoState extends State<TableDemoStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          Container(
            color: Colors.blue[200],
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            width: 70,
            height: 100,
          ),
          Container(
            color: Colors.blue[200],
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            width: 70,
            height: 70,
          ),
          Container(
            color: Colors.blue[200],
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            width: 70,
            height: 70,
          ),
        ]),
        TableRow(children: [
          Container(
            color: Colors.blue[300],
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            width: 70,
            height: 70,
          ),
          Container(
            color: Colors.blue[300],
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            width: 70,
            height: 100,
            alignment: Alignment.center,
            child: Text('Table, 3行3列'),
          ),
          Container(
            color: Colors.blue[300],
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            width: 70,
            height: 70,
          ),
        ]),
        TableRow(children: [
          Container(
            color: Colors.blue[400],
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            width: 70,
            height: 70,
          ),
          Container(
            color: Colors.blue[400],
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            width: 70,
            height: 70,
          ),
          Container(
            color: Colors.blue[400],
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            width: 70,
            height: 100,
          ),
        ])
      ],
      //横向宽度，权重，这里这样写分别占总宽度的1/4, 2/4, 1/4
      columnWidths: {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(1)
      },

//        columnWidths: {0: FixedColumnWidth(100),1: FixedColumnWidth(70),2: FixedColumnWidth(130)},//具体宽度，这里这样写宽度分别为100，70，130
      defaultVerticalAlignment: TableCellVerticalAlignment.middle, //纵向的对齐方式
//      defaultColumnWidth: FlexColumnWidth(1.0),
    );
  }
}

class DemoSliverGridDelegate extends SliverGridDelegate{
  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    // TODO: implement getLayout
    return null;
  }

  @override
  bool shouldRelayout(SliverGridDelegate oldDelegate) {
    // TODO: implement shouldRelayout
    return null;
  }

}

class FlowStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FlowState();
  }
}

class FlowState extends State<FlowStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Flow(children: <Widget>[
      Container(
        color: Colors.blue[400],
        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      ),
      Container(
        color: Colors.blue[400],
        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      ),
      Container(
        color: Colors.blue[400],
        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      ),
      Container(
        color: Colors.blue[400],
        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      ),
      Container(
        color: Colors.blue[400],
        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      ),
      Container(
        color: Colors.blue[400],
        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      ),
    ],);
  }


}

class DemoFlowDelegate extends FlowDelegate{
  @override
  void paintChildren(FlowPaintingContext context) {
    // TODO: implement paintChildren
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }

}
