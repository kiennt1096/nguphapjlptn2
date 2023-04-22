import '../core.dart';

class BaiTap {
  int? id;
  List<CauHoi>? listCauHoi;

  BaiTap({
    this.id,
    this.listCauHoi,
  });

  // factory BaiTap.fromJson(map) {
  //   return BaiTap(
  //     id: map["id"],
  //     listCauHoi: CauHoi.parseData(map),
  //   );
  // }

  BaiTap.fromJson(map) {
    id = map["id"];
    if (map["cauHoiList"] != null) {
      listCauHoi = <CauHoi>[];
      map["cauHoiList"].forEach((v) {
        listCauHoi!.add(CauHoi.fromJson(v));
      });
    }
  }

  // static List<BaiTap> parseData(map) {
  //   var list = map["baiTapList"] as List;
  //   return list.map((baitap) => BaiTap.fromJson(baitap)).toList();
  // }
}
