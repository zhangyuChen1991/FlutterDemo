import 'dart:developer';

import 'package:first_flutter_app/ui/qqmusic/HomeTabRadioPage.dart';
import 'package:first_flutter_app/ui/qqmusic/HomeTabRecommendPage.dart';
import 'package:flutter/cupertino.dart';
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
  TitleBar titleBar = TitleBar();


  @override
  Widget build(BuildContext context) {

    PageController mPageController = new PageController();
    mPageController.addListener(() {

      var mPageOffset = mPageController.offset;//相对于整个PageView滚动控件，位置偏移量(滚动的距离)
      var mPageIndex = mPageController.page;//从第一个tab滑到第二个tab的过程中，mPageIndex会从0逐渐变到1
      log("mPageOffset: "+mPageOffset.toString()+", mPageIndex: "+mPageIndex.toString());

      //计算滑动指示器的左边距，直接套用这个公式就可以了: 初始左边距加上tab间距乘以mPageController.page
      var leftMargin = 10+ mPageIndex* 50;
      titleBar.titleBarState.setState(() {
        _mIndicatorLeftMargin = leftMargin;
      });
    });
    return Column(
      children: [
        titleBar,
        Expanded(
          child: PageView(
            controller: mPageController,
            scrollDirection: Axis.horizontal,
            children: [HomeTabRecommendPage(), HomeTabRadioPage()],
        ))
      ],
    );
  }
}

class TitleBar extends StatefulWidget {
  TitleBarState titleBarState = TitleBarState();
  @override
  State<StatefulWidget> createState() {
    return titleBarState;
  }
}

double _mIndicatorLeftMargin = 10;
class TitleBarState extends State {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 30,
        ),
        Row(
          children: [getTitleBarText("推荐"), getTitleBarText("电台")],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(_mIndicatorLeftMargin, 10, 0, 0),
          height: 5,
          width: 30,
          decoration: new BoxDecoration(
            border: new Border.all(color: Color(0xFF22D59C), width: 0.5), // 边色与边宽度
            color: Color(0xFF22D59C), // 底色
            //        shape: BoxShape.circle, // 圆形，使用圆形时不可以使用borderRadius
            shape: BoxShape.rectangle, // 默认值也是矩形
            borderRadius: new BorderRadius.circular((5.0)), // 圆角度
          ),
        )
      ],
    );
  }
}

getTitleBarText(String title) {
  return Container(
      height: 40,
      width: 50,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 1),
      child: (Text(title, style: new TextStyle(fontSize:16,fontStyle: FontStyle.normal,color: Color(0xFF263138)))));
}
