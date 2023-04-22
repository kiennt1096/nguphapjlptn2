import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nguphapn2_app/core.dart';

class GrammarView extends GetView<GrammarController> {
  const GrammarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as NguPhap;
    controller.checkData(int.parse(arguments.id.toString()));
    return myGrammarScaffold(arguments);
  }

  Scaffold myGrammarScaffold(NguPhap nguPhap) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          "~${nguPhap.tenNguPhap}",
          style: TextStyle(
            fontFamily: fontJP,
            fontSize: getScreenHeight(24),
            color: textColor,
          ),
        ),
        backgroundColor: backgroundColor,
        iconTheme: const IconThemeData(color: textColor),
        elevation: 0,
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  controller.lambaitapButtonFunction(
                      int.parse(nguPhap.id.toString()));
                },
                child: Container(
                  padding: EdgeInsets.all(getScreenHeight(5)),
                  decoration: BoxDecoration(
                      color: textBtnColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: borderColor, width: getScreenHeight(1))),
                  child: const Icon(Icons.auto_stories),
                ),
              ),
            ],
          ),
          SizedBox(width: getScreenHeight(16))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // color: textBtnColor,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: getScreenHeight(1), color: backgroundColor),
                        color: textBtnColor,
                        borderRadius:
                            BorderRadius.circular(getScreenHeight(16))),
                    padding: EdgeInsets.all(getScreenHeight(16)),
                    margin: EdgeInsets.all(getScreenHeight(16)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              nguPhap.congthucT.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textColor,
                                fontFamily: fontVNBold,
                                fontSize: getScreenHeight(16),
                              ),
                            ),
                            Text(
                              "+",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: getScreenHeight(16),
                              ),
                            ),
                            Text(
                              nguPhap.congthucS.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textColor,
                                fontFamily: fontJP,
                                fontWeight: FontWeight.bold,
                                fontSize: getScreenHeight(16),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: getScreenHeight(32)),
                        Text(
                          nguPhap.nghia.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: primaryColor,
                            fontFamily: fontVNBold,
                            fontSize: getScreenHeight(16),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: getScreenHeight(16)),
                  Container(
                    //color: textBtnColor,
                    width: double.infinity,
                    padding: EdgeInsets.all(getScreenHeight(16)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              csd,
                              style: TextStyle(
                                color: primaryColor,
                                fontFamily: fontVNBold,
                                fontSize: getScreenHeight(16),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: getScreenHeight(1),
                                width: double.infinity,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: getScreenHeight(16)),
                        Text(
                          nguPhap.cachSD.toString(),
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: textColor,
                            fontFamily: fontVN,
                            fontSize: getScreenHeight(16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getScreenHeight(16)),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(getScreenHeight(16)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              vidu,
                              style: TextStyle(
                                color: primaryColor,
                                fontFamily: fontVNBold,
                                fontSize: getScreenHeight(16),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: getScreenHeight(1),
                                width: double.infinity,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: getScreenHeight(16)),
                        Text(
                          "${nguPhap.viDu}",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: textColor,
                            fontFamily: fontJP,
                            fontSize: getScreenHeight(16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getScreenHeight(16)),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     IconButtonWithTitle(
                  //       icon: Icons.star_rounded,
                  //       title: ghinho,
                  //       press: () {
                  //         controller.favouriteButtonFunction(Grammar(
                  //             id: nguPhap.id,
                  //             nameJP: nguPhap.tenNguPhap,
                  //             nameVN: nguPhap.nghia));
                  //       },
                  //     ),
                  //     IconButtonWithTitle(
                  //       icon: Icons.library_books_outlined,
                  //       title: lambaitap,
                  //       press: () {
                  //         controller.lambaitapButtonFunction(
                  //             int.parse(nguPhap.id.toString()));
                  //       },
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
          Obx(() => Container(
                color: textBtnColor,
                padding: EdgeInsets.symmetric(
                    vertical: getScreenHeight(8),
                    horizontal: getScreenHeight(16)),
                child: OutlinedButton(
                  onPressed: () {
                    int.parse(controller.favouritelisted.toString()) == 0
                        ? controller.favouriteButtonFunction(Grammar(
                            id: nguPhap.id,
                            nameJP: nguPhap.tenNguPhap,
                            nameVN: nguPhap.nghia))
                        : controller.deleteGrammar(
                            int.parse(nguPhap.id.toString()),
                            nguPhap.tenNguPhap.toString());
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(getScreenHeight(10)))),
                    backgroundColor: MaterialStateProperty.all(
                        int.parse(controller.favouritelisted.toString()) == 0
                            ? primaryColor
                            : trueSelectedColor),
                    side: MaterialStateProperty.all(BorderSide(
                      color:
                          int.parse(controller.favouritelisted.toString()) == 0
                              ? primaryColor
                              : trueSelectedColor,
                      width: getScreenHeight(1),
                    )),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: getScreenHeight(15),
                        horizontal: getScreenHeight(15)),
                    child: Center(
                      child: Text(
                        int.parse(controller.favouritelisted.toString()) == 0
                            ? ghinho
                            : xoaghinho,
                        style: TextStyle(
                          color: textBtnColor,
                          fontSize: getScreenHeight(16),
                          fontFamily: fontVNBold,
                        ),
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
