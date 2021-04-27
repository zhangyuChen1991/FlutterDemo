import 'package:flutter/material.dart';

/// 创建时间：2021/4/26 
/// 作者：4cv748wpdb
/// 描述：

class RecommentData {
  String img1;
  String img2;
  String img3;
  String descText;
  bool onlyShowFirstImg = false;

  RecommentData(
      this.img1, this.img2, this.img3, this.descText, this.onlyShowFirstImg);
}