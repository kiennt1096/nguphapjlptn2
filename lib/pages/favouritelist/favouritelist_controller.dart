import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nguphapn2_app/core.dart';
import 'package:path_provider/path_provider.dart';

class FavouriteListController extends GetxController {
  List<Grammar> favouriteGrammarList = <Grammar>[].obs;
  List<NguPhap> nguPhapList = [];

  final skipTutorial = GetStorage();

  Future loadFavouriteGrammarList() async {
    favouriteGrammarList
        .assignAll(await DatabaseHelper.instance.listFavourite());
    return favouriteGrammarList;
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

  onPressed(int grammarID) async {
    EasyLoading.show(status: runningState);
    await loadJson();
    EasyLoading.dismiss();
    Get.toNamed(Routes.grammar, arguments: nguPhapList[grammarID - 1]);
  }

  deleteGrammar(Grammar grammar) async {
    try {
      await DatabaseHelper.instance
          .deleteGrammar(int.parse(grammar.id.toString()));
      loadFavouriteGrammarList();
      Get.snackbar(
        snackbarDeleteDone,
        "Đã xoá ~${grammar.nameJP} khỏi Ghi Nhớ!",
        backgroundColor: trueSelectedColor,
        duration: const Duration(seconds: 1),
        colorText: backgroundColor,
      );
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

  showdialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        pageBuilder: (context, animation, secondaryAnimation) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(getScreenHeight(16)),
              decoration: BoxDecoration(
                  color: textBtnColor,
                  borderRadius:
                      BorderRadius.all(Radius.circular(getScreenHeight(15)))),
              margin: EdgeInsets.all(getScreenHeight(16)),
              //width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    huongdan,
                    style: TextStyle(
                      fontSize: getScreenHeight(24),
                      color: textColor,
                      fontFamily: fontVNBold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: getScreenHeight(16)),
                  SizedBox(
                    height: getScreenHeight(150),
                    child: SvgPicture.asset(
                        "assets/images/undraw_swipe_options_2e4v.svg"),
                  ),
                  SizedBox(height: getScreenHeight(16)),
                  const Text(
                    deleteturotial,
                    style: TextStyle(color: textColor, fontFamily: fontVNBold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: getScreenHeight(32)),
                  OutlinedButton(
                      onPressed: () {
                        skipTutorial.write("skipTutorial", "ok");
                        Get.back();
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      getScreenHeight(10)))),
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor),
                          side: MaterialStateProperty.all(BorderSide(
                            color: primaryColor,
                            width: getScreenHeight(1),
                          ))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: getScreenHeight(15),
                            horizontal: getScreenHeight(15)),
                        child: Center(
                          child: Text(
                            ok,
                            style: TextStyle(
                              color: textBtnColor,
                              fontSize: getScreenHeight(16),
                              fontFamily: fontVNBold,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          );
        });
  }
}
