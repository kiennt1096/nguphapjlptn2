class NguPhap {
  int? id;
  String? tenNguPhap;
  String? congthucT;
  String? congthucS;
  String? nghia;
  String? cachSD;
  String? viDu;

  NguPhap({
    this.id,
    this.tenNguPhap,
    this.congthucT,
    this.congthucS,
    this.nghia,
    this.cachSD,
    this.viDu,
  });

  factory NguPhap.fromJson(map) {
    return NguPhap(
      id: map["id"],
      tenNguPhap: map["tenNguPhap"],
      congthucT: map["congthucT"],
      congthucS: map["congthucS"],
      nghia: map["nghia"],
      cachSD: map["cachSD"],
      viDu: map["viDu"],
    );
  }

  static List<NguPhap> parseData(map) {
    var list = map["nguPhapList"] as List;
    return list.map((nguphap) => NguPhap.fromJson(nguphap)).toList();
  }
}
