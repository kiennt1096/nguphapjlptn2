class CauHoi {
  int? id;
  int? loaiCH;
  String? cauhoi;
  String? dapan;
  String? dapan1;
  String? dapan2;
  String? dapan3;
  String? dapan4;

  CauHoi({
    this.id,
    this.loaiCH,
    this.cauhoi,
    this.dapan,
    this.dapan1,
    this.dapan2,
    this.dapan3,
    this.dapan4,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     "id": id,
  //     "loaiCH": loaiCH,
  //     "cauhoi": cauhoi,
  //     "dapan": dapan,
  //     "dapan1": dapan1,
  //     "dapan2": dapan2,
  //     "dapan3": dapan3,
  //     "dapan4": dapan4,
  //   };
  // }

  factory CauHoi.fromJson(map) {
    return CauHoi(
      id: map["id"],
      loaiCH: map["loaiCH"],
      cauhoi: map["cauhoi"],
      dapan: map["dapan"],
      dapan1: map["dapan1"],
      dapan2: map["dapan2"],
      dapan3: map["dapan3"],
      dapan4: map["dapan4"],
    );
  }

  // static List<CauHoi> parseData(map) {
  //   var list = map["listCauHoi"] as List;
  //   return list.map((cauhoi) => CauHoi.fromJson(cauhoi)).toList();
  // }
}
