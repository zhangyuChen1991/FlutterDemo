import 'dart:ui';

import 'package:first_flutter_app/ui/qqmusic/data/RecommentData.dart';
import 'package:first_flutter_app/ui/qqmusic/data/SongListItemData.dart';
import 'package:first_flutter_app/ui/qqmusic/widget/CommonWidget.dart';
import 'package:first_flutter_app/utils/SizeUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'data/SongItemData.dart';

/// 创建时间：2021/4/20
/// 作者：4cv748wpdb
/// 描述：

class HomeTabRecommendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeTabRecommendPageState();
  }
}

class HomeTabRecommendPageState extends State {
  String image1 =
      ""; //"https://img95.699pic.com/photo/50042/1067.jpg_wh300.jpg";
  String img2 =
      ""; //"https://www.cgufo.com/wp-content/uploads/2018/02/09/3665-2.jpg";
  String img3 =
      ""; //"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvQqUsN0QKhhG9iRu3rBkt3piKDDTveX0Kxw&usqp=CAU";
  List<RecommentData> mRecommentData = [];
  List<SongListItemData> mSongLists = [];
  List<SongItemData> mSongs = [];

  @override
  void initState() {
    mRecommentData.add(RecommentData(image1, img2, img3, "个性电台", false));
    mRecommentData.add(RecommentData(image1, img2, img3, "每日30首", true));
    mRecommentData.add(RecommentData(image1, img2, img3, "百万收藏", true));

    mSongLists.add(SongListItemData("", "治愈纯音.烟花再美也不及你", "1165万"));
    mSongLists.add(SongListItemData("", "时光不再:往事回忆涌上心头", "116万"));
    mSongLists.add(SongListItemData("", "最 Alan Walker", "15万"));
    mSongLists.add(SongListItemData("", "儿童睡前故事精选", "1165万"));
    mSongLists.add(SongListItemData("", "治愈纯音.烟花再美也不及你", "116万"));
    mSongLists.add(SongListItemData("", "治愈纯音.烟花再美也不及你", "1165万"));
    mSongLists.add(SongListItemData("", "治愈纯音.烟花再美也不及你", "116万"));
    mSongLists.add(SongListItemData("", "治愈纯音.烟花再美也不及你", "1165万"));
    mSongLists.add(SongListItemData("", "治愈纯音.烟花再美也不及你", "1165万"));

    mSongs.add(SongItemData("", "Star Sky (DJ原版)", "虞姬-剩下的盛夏"));
    mSongs.add(SongItemData("", "Take Me Higher (抖音原声)", "抖音热门原声-2021.1.2"));
    mSongs.add(SongItemData("", "Thinking of You", "Macy Gray-Thinking of You"));
    mSongs.add(SongItemData("", "Star Sky (DJ原版)", "虞姬-剩下的盛夏"));
    mSongs.add(SongItemData("", "Take Me Higher (抖音原声)", "抖音热门原声-2021.1.2"));
    mSongs.add(SongItemData("", "Thinking of You", "Macy Gray-Thinking of You"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var w = window.physicalSize.width;
    var wDp = SizeUtil.pixToDp(w.toInt());
    var _ratio1 = (80 / (wDp - 80));
    return Container(
        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 0, 10),
                child: Text("Hi 路飞，今日为你打造",
                    style: new TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF263138))),
              ),
              Container(
                  height: 170,
                  child: ListView.builder(
                      itemCount: mRecommentData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return getRecommentItem(index);
                      })),
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("歌单传送门",
                        style: new TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF263138))),
                    Spacer(),
                    CommonWidget.textWithArrow("更多"),
                  ],
                ),
              ),
              Container(
                  height: 416,
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: GridView.builder(
                    itemCount: mSongLists.length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1.4),
                    itemBuilder: (context, index) {
                      return getSongListItem(index);
                    },
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 2),
                height: 30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("大家都在听",
                        style: new TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF263138))),
                    Container(
                      height: 30,
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: new BoxDecoration(
                        color: Color(0xffE2F6F0),
                        // 底色
                        //        shape: BoxShape.circle, // 圆形，使用圆形时不可以使用borderRadius
                        shape: BoxShape.rectangle,
                        // 默认值也是矩形
                        borderRadius: new BorderRadius.circular((15.0)), // 圆角度
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            "images/search_icon_miniplay.png",
                            width: 10,
                            height: 10,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "播放",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff263138)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  height: 270,
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: GridView.builder(
                    itemCount: mSongs.length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio:_ratio1
                    ),
                    itemBuilder: (context, index) {
                      return getSongItem(index);
                    },
                  )),
            ],
          ),
        ));
  }

  Widget getRecommentItem(int index) {
    if (index >= mRecommentData.length) {
      return null;
    }

    RecommentData data = mRecommentData[index];
    return Wrap(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Stack(
              alignment: Alignment(-1.0, 1.0),
              children: [
                Offstage(
                  offstage: data.onlyShowFirstImg,
                  child: Container(
                      width: 220,
                      height: 100,
                      //圆角图片
                      decoration: BoxDecoration(
                          color: Color(0xffFFCC80),
                          borderRadius: BorderRadius.circular(8),
                          image:
                              DecorationImage(image: NetworkImage(data.img2)))),
                ),
                Offstage(
                  offstage: data.onlyShowFirstImg,
                  child: Container(
                      width: 190,
                      height: 100,
                      //圆角图片
                      decoration: BoxDecoration(
                          color: Color(0xff90CAF9),
                          borderRadius: BorderRadius.circular(8),
                          image:
                              DecorationImage(image: NetworkImage(data.img3)))),
                ),
                Container(
                    width: 160,
                    height: 130,
                    //圆角图片
                    decoration: BoxDecoration(
                        color: Color(0xffEF9A9A),
                        borderRadius: BorderRadius.circular(8),
                        image:
                            DecorationImage(image: NetworkImage(data.img1)))),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
            child: Text(data.descText,
                style: new TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                    color: Color(0xFF263138))),
          ),
        ],
      ),
    ]);
  }

  Widget getSongListItem(int index) {
    if (index >= mSongLists.length) {
      return null;
    }

    SongListItemData data = mSongLists[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                width: 140,
                height: 140,
                //圆角图片
                decoration: BoxDecoration(
                    color: Color(0xffBA68C8),
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(image: NetworkImage(data.img)))),
            Container(
              width: 68,
              height: 27,
              padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
              decoration: BoxDecoration(
                  color: Color(0xff978FB3),
                  borderRadius: BorderRadius.circular(13)),
              child: Row(
                children: [
                  Image.asset(
                    "images/gdt_ic_play.webp",
                    width: 15,
                    height: 15,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(data.playCountText,
                      style: new TextStyle(
                          fontSize: 11,
                          fontStyle: FontStyle.normal,
                          color: Color(0xFFffffff))),
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
          child: Text(data.descText,
              style: new TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  color: Color(0xFF263138))),
        ),
      ],
    );
  }

  Widget getSongItem(int index) {
    if (index >= mSongs.length) {
      return null;
    }

    SongItemData data = mSongs[index];

    return Container(
      width: window.physicalSize.width - 20,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 80,
              height: 80,
              //圆角图片
              decoration: BoxDecoration(
                  color: Color(0xffFFF7AACB),
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(image: NetworkImage(data.img)))),
          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.titleText,
                style: TextStyle(fontSize: 14, color: Color(0xff363636)),
              ),
              SizedBox(height: 3,),
              Text(
                data.contentText,
                style: TextStyle(fontSize: 12, color: Color(0xff878787)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
