import '../core.dart';

class BaiTapData {
  List<BaiTap>? baiTapList;

  BaiTapData({this.baiTapList});

  BaiTapData.fromJson(map) {
    if (map["baiTapList"] != null) {
      baiTapList = <BaiTap>[];
      map["baiTapList"].forEach((v) {
        baiTapList!.add(BaiTap.fromJson(v));
      });
    }
  }
}
