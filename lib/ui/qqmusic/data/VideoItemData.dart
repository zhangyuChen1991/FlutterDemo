import 'package:first_flutter_app/ui/qqmusic/data/VideoBean.dart';
import 'package:flutter/material.dart';

/// 创建时间：2021/5/18 
/// 作者：4cv748wpdb
/// 描述：

class VideoItemData {
  static final int TYPE_SINGLE_VIDEO = 1;
  static final int TYPE_TWO_VIDEO = 0;

  int type = TYPE_TWO_VIDEO;

  VideoBean video1;
  VideoBean video2;

  VideoItemData(this.type, this.video1, this.video2);
}