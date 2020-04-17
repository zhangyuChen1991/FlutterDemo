import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BaseWidgetDemo1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BaseWidgetDemo1State();
  }
}

class BaseWidgetDemo1State extends State<BaseWidgetDemo1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'aaa',
        home: Scaffold(
            appBar: AppBar(
              title: Text('基础控件'),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                //靠左
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(25, 20, 15, 0),
                        child: Text('Text in Container:')),
                    Container(
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
                      margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                      alignment: Alignment(-1, 1),
                      //左下方(0,0是中心，-1位左和上，1为右和下，具体看源码)
                      child: Text("A text in container",
                          style: new TextStyle(
                              color: Color(0xFF0000CD),
                              fontStyle: FontStyle.normal,
                              fontSize: 15)),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(25, 20, 15, 0),
                        child: Text('Image:')),
                    Container(
                        width: 200.0,
                        height: 150.0,
                        margin: EdgeInsets.fromLTRB(25, 15, 0, 0),
                        alignment: Alignment(0, 0),
                        decoration: BoxDecoration(boxShadow: [
                          //卡片阴影
                          BoxShadow(
                              color: Colors.black54,
                              offset: Offset(5.0, 5.0),
                              blurRadius: 7.0)
                        ]),
                        child: Image.network(
                          imageUrl,
                          width: 200.0,
                          height: 150.0,
                        )),
                    Container(
                        margin: EdgeInsets.fromLTRB(25, 30, 15, 0),
                        child: Text('TextField:')),
                    Container(
                        child: TextField(
                          maxLines: 5,
                          style: TextStyle(color: Colors.black),
                          controller: editController,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Text',
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(25, 15, 30, 0)),

                    Container(
                        margin: EdgeInsets.fromLTRB(25, 30, 15, 0),
                        child: Text('RaisedButton:')),
                    Container(
                        width: 110,
                        height: 60.0,
                        margin: EdgeInsets.fromLTRB(25, 20, 30, 0),
                        child: RaisedButton(
                          elevation: 5,
                          color: Color(0xff87CEFA),
                          child: Text("Print"),
                          onPressed: () => print(
                              'text inputted: ${editController.text}'), //打日志到控制台
                        )),
                    Container(
                        margin: EdgeInsets.fromLTRB(25, 30, 15, 0),
                        child: Text('FlatButton:')),
                    Container(
                        width: 110,
                        height: 60.0,
                        margin: EdgeInsets.fromLTRB(25, 20, 30, 50),
                        child: FlatButton(
                          color: Color(0xff87CEFA),
                          child: Text("Print"),
                          onPressed: () => print(
                              'text inputted: ${editController.text}'), //打日志到控制台
                        )),
                  ]),

            )
            ));
  }

  TextEditingController editController = new TextEditingController();
  String imageUrl =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586522138430&di=667b8a40590b39f221ce0c928ecc250a&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201605%2F16%2F20160516213349_eFVsQ.jpeg";
}
