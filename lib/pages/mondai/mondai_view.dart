import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core.dart';

class MondaiView extends GetView<MondaiController> {
  const MondaiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          baiTap,
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
        future: controller.loadJson(int.parse(arguments.toString())),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const LoadingWidget();
          } else {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        controller.cauHoiList.length,
                        (index) => Obx(
                          () => Question(
                            cauHoi: controller.cauHoiList[index],
                            index: index,
                            temp: int.parse(controller.temp.toString()),
                            finished: controller.finish.value,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: textBtnColor,
                  padding: EdgeInsets.symmetric(
                      vertical: getScreenHeight(8),
                      horizontal: getScreenHeight(16)),
                  child: OutlinedButton(
                    onPressed: () {
                      controller.finished();
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(getScreenHeight(10)))),
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                        side: MaterialStateProperty.all(BorderSide(
                          color: primaryColor,
                          width: getScreenHeight(1),
                        ))),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: getScreenHeight(15),
                          horizontal: getScreenHeight(15)),
                      child: Center(
                        child: Text(
                          xemDapAn,
                          style: TextStyle(
                            color: textBtnColor,
                            fontSize: getScreenHeight(16),
                            fontFamily: fontVNBold,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}

class Question extends StatelessWidget {
  final int index;
  final CauHoi cauHoi;
  final int temp;
  final bool finished;
  const Question({
    Key? key,
    required this.cauHoi,
    required this.index,
    required this.temp,
    required this.finished,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getScreenHeight(16)),
      child: Column(
        children: [
          // Row(
          //   children: [
          //     RichText(
          //       text: TextSpan(
          //         text: "Câu ${cauHoi.id}: ",
          //         style: TextStyle(
          //           fontFamily: fontVN,
          //           fontSize: getScreenHeight(16),
          //           color: textColor,
          //         ),
          //         children: [
          //           TextSpan(
          //               text: cauHoi.loaiCH == 1 ? ducLo : noiCau,
          //               style: TextStyle(
          //                 fontFamily: fontVN,
          //                 fontSize: getScreenHeight(16),
          //                 color: textColor,
          //               )),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(height: getScreenHeight(8)),
          Text(
            cauHoi.cauhoi.toString(),
            style: TextStyle(
              color: primaryColor,
              fontFamily: fontJP,
              fontSize: getScreenHeight(16),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            cauHoi.loaiCH == 1 ? ducLo : noiCau,
            style: TextStyle(
              fontFamily: fontVN,
              fontSize: getScreenHeight(16),
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: getScreenHeight(8)),
          AnswerCard(
              answer: cauHoi.dapan1.toString(),
              index: index,
              dapan: cauHoi.dapan.toString()),
          SizedBox(height: getScreenHeight(8)),
          AnswerCard(
              answer: cauHoi.dapan2.toString(),
              index: index,
              dapan: cauHoi.dapan.toString()),
          SizedBox(height: getScreenHeight(8)),
          AnswerCard(
              answer: cauHoi.dapan3.toString(),
              index: index,
              dapan: cauHoi.dapan.toString()),
          SizedBox(height: getScreenHeight(8)),
          AnswerCard(
              answer: cauHoi.dapan4.toString(),
              index: index,
              dapan: cauHoi.dapan.toString()),
          SizedBox(height: getScreenHeight(32)),
        ],
      ),
    );
  }
}

class AnswerCard extends StatelessWidget {
  final int index;
  final String answer;
  final String dapan;
  const AnswerCard({
    Key? key,
    required this.answer,
    required this.index,
    required this.dapan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MondaiController>(
        init: MondaiController(),
        builder: (controller) {
          Color getColor() {
            if (answer == controller.selected[index] &&
                controller.finish.value == false) {
              return rememberColor;
            } else if (answer == dapan && controller.finish.value == true) {
              return trueSelectedColor;
            } else if (answer == controller.selected[index] &&
                controller.finish.value == true) {
              return wrongSelectedColor;
            } else {
              return textColor;
            }
          }

          return SizedBox(
            width: double.infinity,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(textBtnColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(getScreenHeight(16)),
                    side: BorderSide(
                        color: getColor() == textColor
                            ? backgroundColor
                            : getColor()))),
              ),
              onPressed: () {
                if (controller.finish.value == false) {
                  controller.selected[index] = answer;
                  controller.temp.value = controller.temp.value + 1;
                } else {}
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: getScreenHeight(5)),
                child: Center(
                  child: Text(
                    answer,
                    style: TextStyle(
                      fontFamily: fontJP,
                      fontSize: getScreenHeight(16),
                      color: getColor(),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
