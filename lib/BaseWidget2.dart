import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseWidgetDemo2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BaseWidgetDemo2State();
  }
}

class BaseWidgetDemo2State extends State<BaseWidgetDemo2> {
  double rating = 0;
  double rating1 = 0;
  String checkBoxOn = "checkBoxOff";
  var checkBoxChecked = false;
  String radioSelectedPosition;

  bool switchOn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'aaa',
      home: Scaffold(
          appBar: AppBar(
            title: Text('基础控件'),
          ),
          body: Container(
              padding: EdgeInsets.fromLTRB(25, 15, 0, 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //靠左
                  verticalDirection: VerticalDirection.down,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                        margin: EdgeInsets.fromLTRB(0, 0, 15, 10),
                        child:
                            Text('1.设置了dividions=4，进度条被分为四等分，滑动时进度会停留在等分点上')),
                    Container(
                      color: Colors.grey[100],
                      padding: EdgeInsets.fromLTRB(0, 50, 0, 10),
                      margin: EdgeInsets.fromLTRB(0, 0, 15, 10),
                      alignment: Alignment(-1, 0),
                      //左下方(0,0是中心，-1位左和上，1为右和下，具体看源码)
                      //dividions 几等分，会在进度条上显示等分点,进度会停留在等分点上
                      //label 拖动时会有个标签显示在进度点上方
                      child: Slider(
                        label: 'slider',
                        value: rating,
                        divisions: 4,
                        onChanged: (newValue) {
                          setState(() {
                            rating = newValue;
                          });
                          print('rating: ${rating}'); //打日志到控制台)
                        },
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        margin: EdgeInsets.fromLTRB(0, 0, 15, 10),
                        alignment: Alignment(-1, 0),
                        child: Text('2.没有设置dividions和label')),
                    Container(
                      padding: EdgeInsets.fromLTRB(0.0, 10, 0, 10),
                      margin: EdgeInsets.fromLTRB(0, 10, 15, 10),
                      alignment: Alignment(-1, 0),
                      //min和max为最小进度值和最大进度值，不设置的话默认为0到1
                      child: Slider(
                        inactiveColor: Colors.cyan[100],
                        activeColor: Colors.cyan[400],
                        min: 0,
                        max: 2,
                        label: 'slider',
                        value: rating1,
                        onChanged: (newValue) {
                          setState(() {
                            rating1 = newValue;
                          });
                          print('rating1: ${rating1}'); //打日志到控制台)
                        },
                      ),
                    ),

                    Container(
                        width: 200.0,
                        margin: EdgeInsets.fromLTRB(0, 5, 20, 20),
                        alignment: Alignment(-1, 0),
                        child: Row(
                          children: <Widget>[
                            Text(checkBoxOn),
                            Checkbox(
                              value: checkBoxChecked,
                              onChanged: (change) {
                                setState(() {
                                  checkBoxOn =
                                      change ? 'checkBoxOn' : 'checkBoxOff';
                                  checkBoxChecked = change;
                                  print(
                                      'checkBox change: ${change}'); //打日志到控制台)
                                });
                              },
                            )
                          ],
                        )),

                    Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 15, 0),
                        child:
                        Text('Radio:')),
                    Row(
                      children: <Widget>[
                        Text('1'),
                        Radio(
                          value: '1',
                          groupValue: this.radioSelectedPosition,
                          onChanged: (radioChange) {
                            setState(() {
                                this.radioSelectedPosition = radioChange;
                            });
                            print('radioChange1: ${radioChange}'); //打日志到控制台)

                          },
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('2'),
                        Radio(
                          value:'2',
                          groupValue: this.radioSelectedPosition,
                          onChanged: (radioChange) {
                            setState(() {
                                this.radioSelectedPosition = radioChange;
                            });
                            print('radioChange2: ${radioChange}'); //打日志到控制台)
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('3'),
                        Radio<String>(
                          value: '3',
                          groupValue: this.radioSelectedPosition,
                          onChanged: (radioChange) {
                            setState(() {
                                this.radioSelectedPosition = radioChange;
                            });
                            print('radioChange3: ${radioChange}'); //打日志到控制台)
                          },
                        ),
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 25, 15, 0),
                        child:
                        Text('Switch:')),
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                        child: Switch(
                          activeColor: Colors.deepOrange[300],
                          activeTrackColor: Colors.deepOrange[600],
                          inactiveTrackColor: Colors.blue[300],
                          inactiveThumbColor: Colors.blue[100],
                          inactiveThumbImage: NetworkImage(imageUrl),
                          value: switchOn,
                          onChanged: (switchOn){
                            setState(() {
                              this.switchOn = switchOn;
                              print('switchOn: ${switchOn}'); //打日志到控制台)
                            });
                          },
                        )),
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                        child: Switch(
                          value: switchOn,
                          onChanged: (switchOn){
                            setState(() {
                              this.switchOn = switchOn;
                              print('switchOn: ${switchOn}'); //打日志到控制台)
                            });
                          },
                        )),
                  ]))),
    );
  }

  TextEditingController editController = new TextEditingController();
  String imageUrl =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586522138430&di=667b8a40590b39f221ce0c928ecc250a&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201605%2F16%2F20160516213349_eFVsQ.jpeg";
}
