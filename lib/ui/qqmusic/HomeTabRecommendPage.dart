import 'package:first_flutter_app/ui/qqmusic/data/RecommentData.dart';
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

  @override
  void initState() {
    mRecommentData.add(RecommentData(image1, img2, img3, "个性电台"));
    mRecommentData.add(RecommentData(image1, img2, img3, "每日30首"));
    mRecommentData.add(RecommentData(image1, img2, img3, "百万收藏"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: Row(
          children: [
            Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return getRecommentItem(index);
                    }))
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
                Container(
                  width: 220,
                  height: 100,
                  color: Color(0xffFFCC80),
                  child: Image.network(data.img2),
                ),
                Container(
                  width: 190,
                  height: 100,
                  color: Color(0xff90CAF9),
                  child: Image.network(data.img3),
                ),
                Container(
                  width: 160,
                  height: 130,
                  color: Color(0xffEF9A9A),
                  child: Image.network(data.img1),
                ),
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
}
