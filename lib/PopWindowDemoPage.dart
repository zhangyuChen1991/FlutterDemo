import 'package:first_flutter_app/PopWindow.dart';
import 'package:flutter/material.dart';

import 'WidgetUtils.dart';

/// 创建时间：2021/9/24
/// 作者：4cv748wpdb
/// 描述：

class PopWindowDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PopWindowDemoState();
  }
}

class PopWindowDemoState extends State<PopWindowDemoPage> {
  @override
  Widget build(BuildContext context) {
    String s1 = "目标控件1";
    Text text = Text(s1,
        key: GlobalKey(),
        style: TextStyle(
            fontSize: 16,
            color: Color(0xff000000),));

    return MaterialApp(
        title: 'aaa',
        home: Scaffold(
            appBar: AppBar(
              title: Text('PopWindowDemo'),
            ),
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    GestureDetector(
                      child: Container(child: text,width: 100,height: 100,color: Color(0xffededed),),
                      onTap: () {
                        WidgetUtils.showToast('onTap');

                        PopWindow.showPopWindow(context, "目标控件1 show popwindow.\n todo: 可以在这个基础上改造自己需要的PopWindow",
                            text.key, PopDirection.bottom, null, 10);
                      },
                    ),
                  ],
                ))));
  }
}
