import '../core.dart';

class NguPhapData {
  List<NguPhap>? nguPhapList;

  NguPhapData({this.nguPhapList});

  factory NguPhapData.fromJson(map) {
    return NguPhapData(
      nguPhapList: NguPhap.parseData(map),
    );
  }
}
