import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core.dart';

class FavouriteListView extends GetView<FavouriteListController> {
  const FavouriteListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          npdl,
          style: TextStyle(
            fontFamily: fontVNBold,
            fontSize: getScreenHeight(24),
            color: textColor,
          ),
        ),
        backgroundColor: backgroundColor,
        iconTheme: const IconThemeData(color: textColor),
        elevation: 0,
      ),
      body: FutureBuilder(
        future: controller.loadFavouriteGrammarList(),
        builder: ((context, snapshot) {
          if (snapshot.data == null) {
            return const LoadingWidget();
          } else if (controller.favouriteGrammarList.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: getScreenHeight(100),
                  // margin:
                  //     EdgeInsets.symmetric(horizontal: getScreenHeight(100)),
                  child: SvgPicture.asset(
                      "assets/images/undraw_notify_re_65on.svg"),
                ),
                SizedBox(height: getScreenHeight(32)),
                Text(
                  emptyfavlist,
                  style: TextStyle(
                      color: textColor,
                      fontFamily: fontVNBold,
                      fontSize: getScreenHeight(16)),
                  textAlign: TextAlign.center,
                )
              ],
            );
          } else {
            if (!GetStorage().hasData("skipTutorial")) {
              Future.delayed(const Duration(seconds: 1), () {
                showGeneralDialog(
                    context: context,
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsets.all(getScreenHeight(16)),
                          decoration: BoxDecoration(
                              color: textBtnColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(getScreenHeight(15)))),
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
                                style: TextStyle(
                                    color: textColor, fontFamily: fontVNBold),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: getScreenHeight(32)),
                              OutlinedButton(
                                  onPressed: () {
                                    controller.skipTutorial
                                        .write("skipTutorial", "ok");
                                    Get.back();
                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      getScreenHeight(10)))),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              primaryColor),
                                      side:
                                          MaterialStateProperty.all(BorderSide(
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
              });
            }

            return Container(
              color: backgroundColor,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        Column(
                          children:
                              controller.favouriteGrammarList.map((grammar) {
                            return Dismissible(
                                key: Key(grammar.id.toString()),
                                background: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: getScreenHeight(16)),
                                    const Icon(
                                      Icons.arrow_circle_right_outlined,
                                      color: primaryColor,
                                    ),
                                    SizedBox(width: getScreenHeight(8)),
                                    Text(
                                      vdx,
                                      style: TextStyle(
                                          fontFamily: fontVNBold,
                                          color: primaryColor,
                                          fontSize: getScreenHeight(16)),
                                    ),
                                  ],
                                ),
                                secondaryBackground: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      vdx,
                                      style: TextStyle(
                                          fontFamily: fontVNBold,
                                          color: primaryColor,
                                          fontSize: getScreenHeight(16)),
                                    ),
                                    SizedBox(width: getScreenHeight(8)),
                                    const Icon(
                                      Icons.arrow_circle_left_outlined,
                                      color: primaryColor,
                                    ),
                                    SizedBox(width: getScreenHeight(16)),
                                  ],
                                ),
                                onDismissed: (direction) {
                                  controller.deleteGrammar(grammar);
                                },
                                child: favouriteCard(
                                  grammar,
                                  () {
                                    controller.onPressed(
                                        int.parse(grammar.id.toString()));
                                  },
                                ));
                          }).toList(),
                        ),
                      ],
                    )),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }

  Container favouriteCard(Grammar grammar, Function onPressed) {
    return Container(
      //padding: EdgeInsets.all(getScreenHeight(16)),
      margin: EdgeInsets.symmetric(
          horizontal: getScreenHeight(16), vertical: getScreenHeight(8)),
      decoration: BoxDecoration(
        color: textBtnColor,
        borderRadius: BorderRadius.all(Radius.circular(getScreenHeight(15))),
      ),
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(textBtnColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(getScreenHeight(10)))),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getScreenHeight(16), vertical: getScreenHeight(8)),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "~${grammar.nameJP}",
                      style: TextStyle(
                        fontSize: getScreenHeight(14),
                        color: textColor,
                        fontFamily: fontJP,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: getScreenHeight(5)),
                    Text(
                      grammar.nameVN.toString(),
                      style: TextStyle(
                        fontSize: getScreenHeight(14),
                        color: textColor,
                        fontFamily: fontVN,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_right_sharp,
                  color: textColor,
                ),
              ]),
        ),
      ),
    );
  }
}
