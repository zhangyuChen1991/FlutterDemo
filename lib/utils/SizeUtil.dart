import 'dart:ui';

import 'package:flutter/material.dart';

/// 创建时间：2021/5/17 
/// 作者：4cv748wpdb
/// 描述：

class SizeUtil {
   static int pixToDp(int pix){
      return (pix / window.devicePixelRatio + 0.5).toInt();
  }
   static int dpToPix(int dp){
      return (dp * window.devicePixelRatio + 0.5).toInt();
  }
}