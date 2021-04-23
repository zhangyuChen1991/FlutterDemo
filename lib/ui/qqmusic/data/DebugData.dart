import 'package:flutter/material.dart';

/// 创建时间：2021/4/22 
/// 作者：4cv748wpdb
/// 描述：

class DebugData {
  static List<SearchBarBean> searchBarItems = [SearchBarBean("星空剪彩","全新舞曲颠覆想象"),SearchBarBean("牧马城市","为你推荐")
    ,SearchBarBean("星空剪彩","全新舞曲颠覆想象"),];


}

class SearchBarBean{
  String text1;
  String text2;

  SearchBarBean(this.text1, this.text2);
}