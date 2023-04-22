import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../core.dart';

class MainController extends GetxController {
  Grammar grammar = Grammar();
  List<NguPhap> nguPhapList = [];

  @override
  void onInit() {
    List<Chapter> chapterList = ChapterServices().getChapterList();
    Chapter chapter = chapterList[Random().nextInt(chapterList.length)];
    grammar = chapter.grammarList[Random().nextInt(chapter.grammarList.length)];
    super.onInit();
  }

  void tcnpBtnFunction() {
    Get.toNamed(Routes.listgrammar);
  }

  void npdlBtnFunction() {
    Get.toNamed(Routes.favourite);
  }

  void mondaiBtn() {
    Get.toNamed(Routes.mondai, arguments: grammar.id);
  }

  void xemchitietButton() async {
    EasyLoading.show(status: runningState);
    await loadJson();
    EasyLoading.dismiss();
    NguPhap nguPhap = NguPhap();
    nguPhap = nguPhapList[int.parse(grammar.id.toString()) - 1];
    Get.toNamed(Routes.grammar, arguments: nguPhap);
  }

  Future loadJson() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    String dataString =
        await File("${appDocDir.path}/finalnguphapdata.json").readAsString();
    var jsonResult = json.decode(dataString);
    if (jsonResult != null) {
      var grammarResult = NguPhapData.fromJson(jsonResult);
      nguPhapList = grammarResult.nguPhapList!;
    }
  }
}
