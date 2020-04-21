import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutStafulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LayoutWidgetState();
  }
}

class LayoutWidgetState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LayoutWidget',
      home: Scaffold(
        appBar: AppBar(title: Text('Layout')),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                child: Text('Container: 主要属性:'),
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              ),
              Container(
                child: Text(
                    'color: Colors.grey[100],\npadding: EdgeInsets.all(15),\nalignment: Alignment.centerLeft,\nmargin: EdgeInsets.fromLTRB(0, 30, 0, 0),\nwidth: double.infinity,\nheight: 没有设置高度，目前为包裹子控件内容,'),
                color: Colors.grey[100],
                padding: EdgeInsets.all(15),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
                width: double.infinity,
              ),
              Text('cloumn: 纵向布局，子控件垂直排列;'),
              Container(
                color: Colors.grey[200],
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                height: 300,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  //主轴方向（纵向）占空间尽量大，(如果没有其他特别的约束条件则要么填满屏幕，要么填满父布局)
                  verticalDirection: VerticalDirection.down,
                  //控件顺序正常顺序,VerticalDirection.up则倒叙
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //纵轴方向上控件排列规则(居中 靠边等)
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //主轴方向上控件排列规则(居中 靠边 均匀分布等)
                  textDirection: TextDirection.ltr,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text('排列这几行文本主要使用的属性:'),
                    Text('verticalDirection:VerticalDirection.up'),
                    Text('crossAxisAlignment: CrossAxisAlignment.center'),
                    Text('mainAxisAlignment: MainAxisAlignment.spaceEvenly'),
                    Text('textBaseline: TextBaseline.ideographic'),
                  ],
                ),
              ),
              Container(
                child: Text(
                    'Row: 横向布局，子控件水平排列;\n排列下面的色块主要使用的属性:\nmainAxisSize: MainAxisSize.max,\nverticalDirection: VerticalDirection.up,\ncrossAxisAlignment: CrossAxisAlignment.center,\nmainAxisAlignment: MainAxisAlignment.spaceAround'),
                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                //主轴方向（横向）占空间尽量大，(如果没有其他特别的约束条件则要么填满屏幕，要么填满父布局)
                verticalDirection: VerticalDirection.down,
                //实测 up和down效果一样，好像没生效。可能只在纵向布局有效。
                crossAxisAlignment: CrossAxisAlignment.end,
                //纵轴方向(纵向)上控件排列规则(居中 靠边等)
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //主轴方向(横向)上控件排列规则(居中 靠边 均匀分布等)
                textBaseline: TextBaseline.ideographic,
                textDirection: TextDirection.rtl,
                //从左到右排列
                children: <Widget>[
                  Container(
                    color: Colors.blue[100],
                    width: 70,
                    height: 70,
                  ),
                  Container(color: Colors.blue[200], width: 70, height: 70),
                  Container(color: Colors.blue[300], width: 70, height: 70),
                  Container(color: Colors.blue[400], width: 70, height: 70),
                ],
              ),
              Container(
                child: Text('Wrap: 可以横向或者纵向布局，单行空间不够时会自动换行'),
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              ),
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.grey[100],
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Wrap(
                  direction: Axis.horizontal,
                  //start end值受textDirection具体值的影响
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  //好像是runAlignment生效了 crossAxisAlignment没有生效
                  runAlignment: WrapAlignment.center,
                  //纵轴方向对齐方式
                  spacing: 15,
                  //主轴方向间距15
                  runSpacing: 10,
                  //纵轴方向间距10
                  textDirection: TextDirection.ltr,
                  children: <Widget>[
                    Container(
                      color: Colors.green[100],
                      width: 70,
                      height: 70,
                    ),
                    Container(color: Colors.green[200], width: 70, height: 70),
                    Container(color: Colors.green[300], width: 70, height: 70),
                    Container(color: Colors.green[400], width: 70, height: 70),
                    Container(
                      color: Colors.green[100],
                      width: 70,
                      height: 70,
                    ),
                    Container(color: Colors.green[200], width: 70, height: 70),
                    Container(color: Colors.green[300], width: 70, height: 70),
                    Container(color: Colors.green[400], width: 70, height: 70),
                  ],
                ),
              ),
              Container(
                child: Text(
                    'Stack: 重叠布局，右下角的子控件只有一部分在Stack内，因为使用Overflow.clip，超出的部分被截掉了'),
                margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
              ),
              Stack(
                fit: StackFit.loose,
                alignment: AlignmentDirectional.center,
                textDirection: TextDirection.ltr,
                overflow: Overflow.clip,
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 120,
                    color: Colors.cyan[200],
                  ),
                  Container(
                    width: 90,
                    height: 90,
                    color: Colors.cyan[400],
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    color: Colors.cyan[600],
                  ),
                  Positioned(
                    left: 100,
                    top: 100,
                    child: Container(
                      width: 120,
                      height: 120,
                      color: Colors.cyan[800],
                    ),
                  )
                  //指定位置，超出stack范围，测试overflow属性
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
