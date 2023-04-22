import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../core.dart';

class ListGrammarController extends GetxController {
  List<Chapter> chapterList = [];
  List<NguPhap> nguPhapList = [];
  NguPhapData? nguPhapData;
  @override
  void onInit() {
    chapterList = ChapterServices().getChapterList();
    super.onInit();
  }

  void btnGrammarFunction(Grammar grammar) {
    Get.toNamed(Routes.grammar, arguments: grammar);
  }

  Future loadJson() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    String dataString =
        await File("${appDocDir.path}/finalnguphapdata.json").readAsString();
    var jsonResult = json.decode(dataString);
    if (jsonResult != null) {
      var grammarResult = NguPhapData.fromJson(jsonResult);
      nguPhapList = grammarResult.nguPhapList!;
      nguPhapData = grammarResult;
      return nguPhapData;
    }
  }
}
