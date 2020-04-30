import 'package:first_flutter_app/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DialogDemoPageState();
  }
}

class DialogDemoPageState extends State<DialogDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RaisedButton(
            child: Text('SimpleDialog'),
            onPressed: () {
              _showSimpleDialog(context);
            },
          ),
          RaisedButton(
            child: Text('AlertDialog'),
            onPressed: () {
              _showAlertDialog(context);
            },
          ),
          RaisedButton(
            child: Text('BottomSheet'),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                        height: 150,
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child:FlatButton(child:Text('item1', style: TextStyle(fontSize: 17)),onPressed: (){},color: Colors.white,),
                              alignment: Alignment.center,
                              height: 50,
                            ),
                            Container(
                              child:FlatButton(child:Text('item2', style: TextStyle(fontSize: 17)),onPressed: (){},color: Colors.white,),
                              alignment: Alignment.center,
                              height: 50,
                            ),
                            Container(
                              child:FlatButton(child:Text('item3', style: TextStyle(fontSize: 17)),onPressed: (){},color: Colors.white,),
                              alignment: Alignment.center,
                              height: 50,
                            ),
                          ],
                        ));
                  });
            },
          ),
          RaisedButton(
            child: Text('CustomDialog'),
            onPressed: () {
              _showMyDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showSimpleDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('SimpleDialog'),
            titlePadding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            //圆角矩形
            children: <Widget>[
              SimpleDialogOption(
                child: Text('button1'),
                onPressed: () {
                  WidgetUtils.showToast('button1');
                },
              ),
              SimpleDialogOption(
                child: Text('button2'),
                onPressed: () {
                  WidgetUtils.showToast('button2');
                },
              )
            ],
          );
        });
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AlertDialog'),
            content: Text('这是一个AlertDialog'),
            titlePadding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            //圆角矩形
            actions: <Widget>[
              RaisedButton(
                child: Text('button1'),
                color: Colors.white,
                disabledColor: Colors.white,
              ),
              RaisedButton(
                child: Text('button2'),
                color: Colors.white,
                disabledColor: Colors.white,
              ),
            ],
          );
        });
  }

  void _showMyDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return GestureDetector(
              onTap: () {
                Navigator.pop(context);//点击外部阴影 弹窗消失
              },
              child: Container(
                color: Colors.transparent,
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {},//点击弹窗主体，自定义事件，覆盖父类的点击事件，避免弹窗消失
                  child: Container(
                    width: 240,
                    height: 160,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Text(
                      '我是自定义的diaolg',
                      style: TextStyle(fontSize: 15,color: Colors.black,decoration: TextDecoration.none),
                    ),
                  ),
                ),
              ));
        });
  }
}
