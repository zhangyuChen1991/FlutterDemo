import 'package:flutter/material.dart';

/// 创建时间：2021/4/27
/// 作者：4cv748wpdb
/// 描述：

class CommonWidget {
  static textWithArrow(String text) {
    return Row(
      children: [
        Text(text,
            style: new TextStyle(fontSize: 14, color: Color(0xFF263138))),
        Image.asset("images/arrow_right_grey_recommend.webp",width: 20,height: 20,)
      ],
    );
  }
}
