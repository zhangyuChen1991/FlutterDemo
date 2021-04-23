import 'dart:io';

import 'package:first_flutter_app/ui/qqmusic/HomeTab.dart';
import 'package:first_flutter_app/ui/qqmusic/MeTab.dart';
import 'package:first_flutter_app/ui/qqmusic/ThirdTab.dart';
import 'package:first_flutter_app/ui/qqmusic/VideoTab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

createIconImage(String imageUrl) {
  return Image.asset(imageUrl,width: 35,height: 35);
}

class HomePageState extends State<HomePage> with WidgetsBindingObserver {
  List<Widget> _tabPageList = [HomeTab(), VideoTab(), ThirdTab(), MeTab()];
  List<BottomNavigationBarItem> _bottomNavigationBarItem = [
    new BottomNavigationBarItem(icon: createIconImage("images/skin_tab_home_normal.webp"),
        label: "首页", activeIcon: createIconImage("images/skin_tab_home_selected.png")),
    new BottomNavigationBarItem(icon: createIconImage("images/skin_tab_video_normal.webp"),
        label: "视频", activeIcon: createIconImage("images/skin_tab_video_selected.png")),
    new BottomNavigationBarItem(icon: createIconImage("images/skin_tab_putoo_normal.webp"),
        label: "扑通", activeIcon: createIconImage("images/skin_tab_putoo_selected.png")),
    new BottomNavigationBarItem(icon: createIconImage("images/skin_tab_mine_normal.webp"),
        label: "我的", activeIcon: createIconImage("images/skin_tab_mine_selected.png")),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    if (Platform.isAndroid) {
      // 在组件渲染之后，再覆写状态栏颜色
      // 如果使用了APPBar，则需要修改statusBarBrightness属性,没使用则不用管
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarBrightness: Brightness.light,statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }

    //statusBarColor 控制背景色值
    //statusBarIconBrightness:Brightness.dark 控制本文色值为黑色 / Brightness.light 这个就是白色

    return MaterialApp(
      home: Scaffold(
        body: this._tabPageList[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: _bottomNavigationBarItem,
          currentIndex: _currentIndex,
          onTap: (int index){
            this.setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  //绑定WidgetsBindingObserver来监听页面的生命周期
  AppLifecycleState _lastLifecycleState;

  @override
  void initState() {
    super.initState();
    //添加监听
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    //remove监听
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _lastLifecycleState = state;
    });

    switch (_lastLifecycleState) {
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
