import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nguphapn2_app/core.dart';

class ListGrammarView extends GetView<ListGrammarController> {
  const ListGrammarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          tcnp,
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
        future: controller.loadJson(),
        builder: ((context, snapshot) {
          if (snapshot.data == null) {
            return const LoadingWidget();
          } else {
            return Column(
              children: [
                //SizedBox(height: getScreenHeight(16)),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: controller.chapterList.map((chapter) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getScreenHeight(16)),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                // side: BorderSide(
                                //   color: borderColor,
                                //   width: getScreenHeight(1),
                                // ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(getScreenHeight(10)))),
                            elevation: 0,
                            child: MyExpansionTileCard(
                              title: ChapterCard(chapter: chapter),
                              children: chapter.grammarList.map((grammar) {
                                return GrammarCard(
                                  grammar: grammar,
                                  function: () {
                                    Get.toNamed(Routes.grammar,
                                        arguments: controller.nguPhapList[
                                            int.parse(grammar.id.toString()) -
                                                1]);
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            );
          }
        }),
      ),
    );
  }
}

class ChapterCard extends StatelessWidget {
  final Chapter chapter;
  const ChapterCard({
    Key? key,
    required this.chapter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getScreenHeight(16)),
      child: Text(
        "CHƯƠNG ${chapter.id}",
        style: TextStyle(
            color: textColor,
            fontFamily: fontVNBold,
            fontSize: getScreenHeight(16)),
      ),
    );
  }
}

class GrammarCard extends StatelessWidget {
  final Grammar grammar;
  final Function function;
  const GrammarCard({
    Key? key,
    required this.grammar,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getScreenHeight(16)),
      child: Column(
        children: [
          Container(
            height: getScreenHeight(1),
            width: double.infinity,
            color: borderColor,
          ),
          TextButton(
            onPressed: () {
              function();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "~${grammar.nameJP}",
                          style: TextStyle(
                            fontSize: getScreenHeight(12),
                            color: textColor,
                            fontFamily: fontJP,
                          ),
                        ),
                        SizedBox(height: getScreenHeight(5)),
                        Text(
                          grammar.nameVN.toString(),
                          style: TextStyle(
                            fontSize: getScreenHeight(12),
                            color: textColor,
                            fontFamily: fontVN,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_right_sharp,
                  color: textColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
