import 'package:first_flutter_app/ui/qqmusic/data/RecommentData.dart';
import 'package:first_flutter_app/ui/qqmusic/data/SongListItemData.dart';
import 'package:first_flutter_app/ui/qqmusic/widget/CommonWidget.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    mRecommentData.add(RecommentData(image1, img2, img3, "个性电台", false));
    mRecommentData.add(RecommentData(image1, img2, img3, "每日30首", true));
    mRecommentData.add(RecommentData(image1, img2, img3, "百万收藏", true));

    mSongLists.add(SongListItemData("", "治愈纯音.烟花再美也不及你", "1165万"));
    mSongLists.add(SongListItemData("", "时光不再:往事回忆涌上心头", "116万"));
    mSongLists.add(SongListItemData("", "最 Alan Walker", "1165万"));
    mSongLists.add(SongListItemData("", "儿童睡前故事精选", "1165万"));
    mSongLists.add(SongListItemData("", "治愈纯音.烟花再美也不及你", "116万"));
    mSongLists.add(SongListItemData("", "治愈纯音.烟花再美也不及你", "1165万"));
    mSongLists.add(SongListItemData("", "治愈纯音.烟花再美也不及你", "116万"));
    mSongLists.add(SongListItemData("", "治愈纯音.烟花再美也不及你", "1165万"));
    mSongLists.add(SongListItemData("", "治愈纯音.烟花再美也不及你", "1165万"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
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
                height: 420,
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
          ],
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
              //圆角图片
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
}
