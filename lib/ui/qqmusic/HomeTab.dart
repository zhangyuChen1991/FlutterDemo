import 'package:first_flutter_app/ui/qqmusic/HomeTabRadioPage.dart';
import 'package:first_flutter_app/ui/qqmusic/HomeTabRecommendPage.dart';
import 'package:flutter/material.dart';

/// 创建时间：2021/4/20
/// 作者：4cv748wpdb
/// 描述：

class HomeTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeTabState();
  }
}

class HomeTabState extends State {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleBar(),
        Expanded(
            child: PageView(
          scrollDirection: Axis.horizontal,
          children: [HomeTabRecommendPage(), HomeTabRadioPage()],
        ))
      ],
    );
  }
}

class TitleBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TitleBarState();
  }
}

class TitleBarState extends State {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [getTitleBarText("推荐"), getTitleBarText("电台")],
        ),
      ],
    );
  }
}

getTitleBarText(String title) {
  return Container(
      height: 50,
      child: (Text(title, style: new TextStyle(color: Color(0xff263138)))));
}
