import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nguphapn2_app/core.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const MainTitle(text: mainTitle),
            NPHMCard(grammar: controller.grammar),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButtonWithTitle(
                  icon: Icons.menu_open,
                  press: () {
                    controller.xemchitietButton();
                  },
                  title: xemchitiet,
                ),
                IconButtonWithTitle(
                  icon: Icons.auto_stories,
                  press: () {
                    controller.mondaiBtn();
                  },
                  title: lambaitap,
                ),
              ],
            ),
            SizedBox(height: getScreenHeight(16)),
            ButtonwithSvg(
              title: tcnp,
              exTitle: tcnpex,
              svg: "assets/images/Formula-bro.svg",
              press: () {
                controller.tcnpBtnFunction();
              },
            ),
            ButtonwithSvg(
              title: npdl,
              exTitle: npdlex,
              svg: "assets/images/Online test-bro.svg",
              press: () {
                controller.npdlBtnFunction();
              },
            ),
            SizedBox(height: getScreenHeight(16)),
          ],
        ),
      ),
    );
  }
}

class ButtonwithSvg extends StatelessWidget {
  final String title;
  final String exTitle;
  final String svg;
  final Function press;
  const ButtonwithSvg({
    Key? key,
    required this.title,
    required this.exTitle,
    required this.svg,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(getScreenHeight(16), getScreenHeight(16),
          getScreenHeight(16), getScreenHeight(0)),
      height: getScreenHeight(100),
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(textBtnColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(getScreenHeight(10)))),
        ),
        onPressed: () {
          press();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: getScreenHeight(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: textColor,
                      fontFamily: fontVNBold,
                      fontSize: getScreenHeight(14),
                    ),
                  ),
                  Text(
                    exTitle,
                    style: TextStyle(
                      color: textColor,
                      fontFamily: fontVN,
                      fontSize: getScreenHeight(12),
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            SizedBox(
                height: getScreenHeight(100),
                width: getScreenWidth(100),
                child: SvgPicture.asset(svg)),
          ],
        ),
      ),
    );
  }
}

class NPHMCard extends StatelessWidget {
  final Grammar grammar;
  const NPHMCard({
    Key? key,
    required this.grammar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(getScreenHeight(16)),
        height: getScreenHeight(300),
        width: double.infinity,
        decoration: BoxDecoration(
            color: textBtnColor,
            border: Border.all(
              width: getScreenHeight(1),
              color: backgroundColor,
            ),
            borderRadius: BorderRadius.circular(getScreenHeight(15))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "~${grammar.nameJP}",
              style: TextStyle(
                  color: textColor,
                  fontFamily: fontJP,
                  fontWeight: FontWeight.bold,
                  fontSize: getScreenHeight(24)),
            ),
            Text(
              grammar.nameVN.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textColor,
                  fontFamily: fontVNBold,
                  fontSize: getScreenHeight(24)),
            ),
          ],
        ),
      ),
    );
  }
}

class MainTitle extends StatelessWidget {
  final String text;
  const MainTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(getScreenHeight(16), getScreenHeight(16),
          getScreenHeight(16), getScreenHeight(0)),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: getScreenHeight(24),
              fontFamily: fontVNBold,
            ),
          ),
        ],
      ),
    );
  }
}
