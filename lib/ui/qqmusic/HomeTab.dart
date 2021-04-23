import 'dart:async';
import 'dart:developer';

import 'package:first_flutter_app/ui/qqmusic/HomeTabRadioPage.dart';
import 'package:first_flutter_app/ui/qqmusic/HomeTabRecommendPage.dart';
import 'package:first_flutter_app/ui/qqmusic/data/DebugData.dart';
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
      var mPageOffset = mPageController.offset; //相对于整个PageView滚动控件，位置偏移量(滚动的距离)
      var mPageIndex =
          mPageController.page; //从第一个tab滑到第二个tab的过程中，mPageIndex会从0逐渐变到1
      log("mPageOffset: " +
          mPageOffset.toString() +
          ", mPageIndex: " +
          mPageIndex.toString());

      //计算滑动指示器的左边距，直接套用这个公式就可以了: 初始左边距加上tab间距乘以mPageController.page
      var leftMargin = 10 + mPageIndex * 50;
      titleBar.titleBarState.setState(() {
        _mIndicatorLeftMargin = leftMargin;
      });
    });
    return Column(
      children: [
        titleBar,
        SearchBar(),
        Expanded(
            child: PageView(
          controller: mPageController,
          scrollDirection: Axis.horizontal,
          children: [HomeTabRecommendPage(), HomeTabRadioPage()],
        )),
      ],
    );
  }
}

class SearchBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    SearchBarState searchBarState = SearchBarState();
    return searchBarState;
  }
}

int _nextSearchBarItem = 0;
PageController mSearchBarPageController = new PageController();

class SearchBarState extends State<SearchBar> with WidgetsBindingObserver {
  var timertimer = Timer.periodic(Duration(seconds: 3), (timer) {
    _nextSearchBarItem = _nextSearchBarItem + 1;
    _nextSearchBarItem = (_nextSearchBarItem % DebugData.searchBarItems.length);
    mSearchBarPageController.animateToPage(_nextSearchBarItem,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOutCirc);

    //如果播到了最后一条，切到第一条重新开始
    if (_nextSearchBarItem == DebugData.searchBarItems.length - 1) {
      // 延时1s执行返回
      Future.delayed(Duration(seconds: 1), () {
        mSearchBarPageController.jumpToPage(0);
        _nextSearchBarItem = 0;
      });
    }
    log("timer task.. _nextSearchBarItem = " +
        _nextSearchBarItem.toString() +
        ", length: " +
        DebugData.searchBarItems.length.toString());
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 40,
      width: double.infinity,
      decoration: new BoxDecoration(
        color: Color(0xFFFFFFFF), // 底色
        //        shape: BoxShape.circle, // 圆形，使用圆形时不可以使用borderRadius
        shape: BoxShape.rectangle, // 默认值也是矩形
        borderRadius: new BorderRadius.circular((20.0)), // 圆角度
      ),
      child: PageView(
        controller: mSearchBarPageController,
        scrollDirection: Axis.vertical,
        children: searchBarItems(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //添加监听
    WidgetsBinding.instance.addObserver(this);
    log("HomeTab,SearchBarState,  initState()");
  }

  @override
  void dispose() {
    //remove监听
    WidgetsBinding.instance.removeObserver(this);
    timertimer.cancel();
    log("HomeTab,SearchBarState,  dispose()");

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //页面状态改变
    switch (state) {
      case AppLifecycleState.inactive:
        //应用处于非活跃状态并且不接收用户输入。
        break;
      case AppLifecycleState.detached:
        //应用依然保留 flutter engine，但是它会脱离全部宿主 view。
        break;
      case AppLifecycleState.paused:
        //应用当前对用户不可见，无法响应用户输入，并运行在后台。对应于 Android 中的 onPause()；
        break;
      case AppLifecycleState.resumed:
        //应用对用户可见并且可以响应用户的输入。这个事件对应于 Android 中的 onPostResume()；

        break;
    }
  }
}

getSearchBarItem(String text1, String text2) {
  return Row(
    children: [
      Image.asset(
        "images/action_search_disable.webp",
        width: 22,
        height: 22,
      ),
      SizedBox(
        width: 5,
      ),
      Text(text1,
          style: new TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.normal,
              color: Color(0xFF868686))),
      SizedBox(
        width: 5,
      ),
      Text(text2,
          style: new TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.normal,
              color: Color(0xFFBFBFBF))),
    ],
  );
}

searchBarItems() {
  List<Widget> items = [];
  for (int i = 0; i < DebugData.searchBarItems.length; i++) {
    items.add(getSearchBarItem(
        DebugData.searchBarItems[i].text1, DebugData.searchBarItems[i].text2));
  }
  return items;
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
        //PagerView滑动指示器
        Container(
          margin: EdgeInsets.fromLTRB(_mIndicatorLeftMargin, 10, 0, 0),
          height: 5,
          width: 30,
          decoration: new BoxDecoration(
            border: new Border.all(color: Color(0xFF22D59C), width: 0.5),
            // 边色与边宽度
            color: Color(0xFF22D59C),
            // 底色
            //        shape: BoxShape.circle, // 圆形，使用圆形时不可以使用borderRadius
            shape: BoxShape.rectangle,
            // 默认值也是矩形
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
      child: (Text(title,
          style: new TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.normal,
              color: Color(0xFF263138)))));
}
