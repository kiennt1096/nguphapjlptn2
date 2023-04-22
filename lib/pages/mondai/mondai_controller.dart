import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../core.dart';

class MondaiController extends GetxController {
  List<BaiTap> baiTapList = [];
  List<CauHoi> cauHoiList = [];
  List<String> selected = ["", "", "", ""];
  var temp = 0.obs;
  var finish = false.obs;

  Future loadJson(int id) async {
    // String dataStringBaiTap =
    //     await rootBundle.loadString("assets/datatest/datatest2.json");
    // var jsonResult = json.decode(dataStringBaiTap);
    // if (jsonResult != null) {
    //   var baiTapResult = BaiTapData.fromJson(jsonResult);
    //   baiTapList = baiTapResult.baiTapList!;
    //   cauHoiList = baiTapList[id - 1].listCauHoi!;
    //   return cauHoiList;
    // }

    final appDocDir = await getApplicationDocumentsDirectory();
    String dataStringBaiTap =
        await File("${appDocDir.path}/datamondai_final.json").readAsString();
    var jsonResult = json.decode(dataStringBaiTap);
    if (jsonResult != null) {
      var baiTapResult = BaiTapData.fromJson(jsonResult);
      baiTapList = baiTapResult.baiTapList!;
      cauHoiList = baiTapList[id - 1].listCauHoi!;
      return cauHoiList;
    }
  }

  void finished() {
    finish.value = true;
  }
}
