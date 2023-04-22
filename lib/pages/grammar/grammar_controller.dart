import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core.dart';

class GrammarController extends GetxController {
  List<NguPhap> nguPhapList = [];
  NguPhapData? nguPhapData;
  var favouritelisted = 0.obs;

  Future loadJson() async {
    String dataStringGrammar =
        await rootBundle.loadString("assets/datatest/datatest.json");
    var jsonGrammarResult = json.decode(dataStringGrammar);
    if (jsonGrammarResult != null) {
      var grammarResult = NguPhapData.fromJson(jsonGrammarResult);
      nguPhapList = grammarResult.nguPhapList!;
      nguPhapData = grammarResult;
      return nguPhapData;
    }
  }

  checkData(int id) async {
    int check = await DatabaseHelper.instance.checkGrammar(id);
    if (check != 0) {
      favouritelisted.value = 1;
    }
  }

  favouriteButtonFunction(Grammar grammar) async {
    int check = await DatabaseHelper.instance.checkGrammar(grammar.id!.toInt());
    if (check == 0) {
      try {
        await DatabaseHelper.instance.insertGrammar(grammar);
        Get.snackbar(
          snackbarDone,
          snackbarDoneDetails,
          backgroundColor: trueSelectedColor,
          duration: const Duration(seconds: 1),
          colorText: backgroundColor,
        );
        checkData(int.parse(grammar.id.toString()));
      } catch (e) {
        Get.snackbar(snackbarError, snackbarError2);
      }
    } else {
      Get.snackbar(
        snackbarError,
        snackbarErrorDetails,
        backgroundColor: primaryColor,
        duration: const Duration(seconds: 1),
        colorText: textBtnColor,
      );
    }
  }

  deleteGrammar(int id, String tenNP) async {
    try {
      await DatabaseHelper.instance.deleteGrammar(id);
      Get.snackbar(
        snackbarDeleteDone,
        "Đã xoá ~$tenNP khỏi Ghi Nhớ!",
        backgroundColor: trueSelectedColor,
        duration: const Duration(seconds: 1),
        colorText: backgroundColor,
      );
      favouritelisted.value = 0;
    } catch (e) {
      Get.snackbar(
        snackbarDeleteError,
        snackbarError2,
        backgroundColor: primaryColor,
        duration: const Duration(seconds: 1),
        colorText: backgroundColor,
      );
    }
  }

  lambaitapButtonFunction(int id) {
    Get.toNamed(Routes.mondai, arguments: id);
  }
}
