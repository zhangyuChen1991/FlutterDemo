import 'dart:developer';
import 'dart:ui';

import 'package:first_flutter_app/ui/qqmusic/data/MenuData.dart';
import 'package:first_flutter_app/ui/qqmusic/data/VideoBean.dart';
import 'package:first_flutter_app/ui/qqmusic/data/VideoItemData.dart';
import 'package:first_flutter_app/utils/SizeUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建时间：2021/4/20
/// 作者：4cv748wpdb
/// 描述：

class HomeTabVideoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeTabVideoPageState();
  }
}

class HomeTabVideoPageState extends State {
  List<VideoItemData> mVideos = [];

  @override
  void initState() {
    mVideos.add(VideoItemData(
        VideoItemData.TYPE_TWO_VIDEO,
        VideoBean("", "2.5万", "03:30", "Alan Walker 《Ignite》", "音乐精选"),
        VideoBean(
            "", "2725", "03:19", "SEVENTEEN日语新曲《NOT Alone》舞台公开", "编辑精选")));
    mVideos.add(VideoItemData(
        VideoItemData.TYPE_TWO_VIDEO,
        VideoBean("", "1.5万", "03:22", "[游戏剪辑/纯音乐欣赏]国风电竞CHINA-2", "Sand"),
        VideoBean("", "2725", "03:19", "The End of Everything | 麦妹最新LA表演live!",
            "编辑精选")));
    mVideos.add(VideoItemData(
        VideoItemData.TYPE_TWO_VIDEO,
        VideoBean("", "2.5万", "03:30", "Alan Walker 《Ignite》", "音乐精选"),
        VideoBean(
            "", "2725", "03:19", "SEVENTEEN日语新曲《NOT Alone》舞台公开", "编辑精选")));
    mVideos.add(VideoItemData(
        VideoItemData.TYPE_TWO_VIDEO,
        VideoBean("", "1.5万", "03:22", "[游戏剪辑/纯音乐欣赏]国风电竞CHINA-2", "Sand"),
        VideoBean("", "2725", "03:19", "The End of Everything | 麦妹最新LA表演live!",
            "编辑精选")));
    mVideos.add(VideoItemData(VideoItemData.TYPE_SINGLE_VIDEO,
        VideoBean("", "1.5万", "03:22", "我的世界 起床战争", "游戏"), null));

    mVideos.add(VideoItemData(
        VideoItemData.TYPE_TWO_VIDEO,
        VideoBean("", "2.5万", "03:30", "Alan Walker 《Ignite》", "音乐精选"),
        VideoBean(
            "", "2725", "03:19", "SEVENTEEN日语新曲《NOT Alone》舞台公开", "编辑精选")));
    mVideos.add(VideoItemData(
        VideoItemData.TYPE_TWO_VIDEO,
        VideoBean("", "1.5万", "03:22", "[游戏剪辑/纯音乐欣赏]国风电竞CHINA-2", "Sand"),
        VideoBean("", "2725", "03:19", "The End of Everything | 麦妹最新LA表演live!",
            "编辑精选")));
    mVideos.add(VideoItemData(
        VideoItemData.TYPE_TWO_VIDEO,
        VideoBean("", "2.5万", "03:30", "Alan Walker 《Ignite》", "音乐精选"),
        VideoBean(
            "", "2725", "03:19", "SEVENTEEN日语新曲《NOT Alone》舞台公开", "编辑精选")));
    mVideos.add(VideoItemData(
        VideoItemData.TYPE_TWO_VIDEO,
        VideoBean("", "1.5万", "03:22", "[游戏剪辑/纯音乐欣赏]国风电竞CHINA-2", "Sand"),
        VideoBean("", "2725", "03:19", "The End of Everything | 麦妹最新LA表演live!",
            "编辑精选")));
    mVideos.add(VideoItemData(VideoItemData.TYPE_SINGLE_VIDEO,
        VideoBean("", "1.5万", "03:22", "我的世界 起床战争", "游戏"), null));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
        height: double.infinity,
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: 10,
            itemBuilder: (context, index) {
            return getVideoItem(mVideos[index]);
        },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
              height: 10,
          );
        },
      ),
    ));
  }
}

Widget getVideoItem(VideoItemData bean) {
  if (bean.type == VideoItemData.TYPE_SINGLE_VIDEO) {
    return getSingleVideoItem(bean.type, bean.video1);
  } else {
    return Row(
      children: [
        getSingleVideoItem(bean.type, bean.video1),
        SizedBox(
          width: 10,
        ),
        getSingleVideoItem(bean.type, bean.video2),
      ],
    );
  }
}

Widget getSingleVideoItem(int type, VideoBean bean) {
  double width = 0;
  double textWidth = 0;
  if (type == VideoItemData.TYPE_TWO_VIDEO) {
    width = (SizeUtil.pixToDp(window.physicalSize.width.toInt()) - 41) / 2;
    textWidth = width - 32;
  } else {
    width =
        (SizeUtil.pixToDp(window.physicalSize.width.toInt()) - 20.toDouble());
    textWidth = width - 42;
  }

  log("width = $width");
  return Container(
    width: width,
    height: 260,
    decoration: new BoxDecoration(
      border: new Border.all(color: Color(0xffe2e8ed), width: 0.5), // 边框色与边宽度
      color: Color(0xFFffffff), // 底色
      shape: BoxShape.rectangle, // 默认值也是矩形
      borderRadius: new BorderRadius.circular((8.0)), // 圆角度
    ),
    child: Column(
      children: [
        Stack(
          children: [
            Container(
                height: 200,
                alignment: Alignment(-1.0, 1.0),
                decoration: new BoxDecoration(
                  color: Color(0xff6495ED), // 底色
                  shape: BoxShape.rectangle, // 默认值也是矩形
                  borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)), // 圆角度
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                  child: Row(children: [
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "images/video_poster_select_video.webp",
                          width: 17,
                          height: 17,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(bean.playCounts,
                            style: new TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFffffff))),
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    Text(bean.videoDuration,
                        style: new TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFffffff))),
                    SizedBox(
                      width: 10,
                    ),
                  ]),
                ))
          ],
        ),
        Container(
          height: 59,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                width: textWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(bean.titleText,
                        maxLines: 2,
                        softWrap: true,
                        style: new TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF263138))),
                    Expanded(child: SizedBox()),
                    Text(bean.descText,
                        style: new TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF95a1a8))),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                child: Image.asset(
                  "images/item_more_icon.webp",
                  width: 20,
                  height: 20,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget getMenuItem(MenuData bean){
  return Column(
    children: [
      Image.asset(
        "images/video_poster_select_video.webp",
        width: 17,
        height: 17,
      ),
      SizedBox(
        width: 3,
      ),
      Text(bean.menuName,
          style: new TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Color(0xFFffffff))),
    ],
  );
}
