import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HeadingText(text: splashXC),
            const DownloadPic(picAsset: 'assets/images/Loading-pana.svg'),
            const SmallTitle(title: splashT1),
            const SmallTitle(title: splashT2),
            Obx(
              () => DownloadButton(
                text: controller.dlBtnTitle.string,
                onpress: controller.downloadFunction,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DownloadButton extends StatelessWidget {
  final String text;
  final Function onpress;
  const DownloadButton({
    Key? key,
    required this.text,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        getScreenHeight(16),
        getScreenHeight(32),
        getScreenHeight(16),
        getScreenHeight(0),
      ),
      child: OutlinedButton(
        onPressed: () {
          onpress();
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(getScreenHeight(10)))),
          backgroundColor: MaterialStateProperty.all(primaryColor),
          side: MaterialStateProperty.all(
            BorderSide(
              color: primaryColor,
              width: getScreenHeight(1),
            ),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: getScreenHeight(15), horizontal: getScreenHeight(15)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textBtnColor,
                fontSize: getScreenHeight(16),
                fontFamily: fontVNBold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SmallTitle extends StatelessWidget {
  final String title;
  const SmallTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenHeight(16)),
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: getScreenHeight(14),
          ),
          textAlign: TextAlign.center,
        ));
  }
}

class DownloadPic extends StatelessWidget {
  final String picAsset;
  const DownloadPic({
    Key? key,
    required this.picAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getScreenHeight(16)),
      child: SvgPicture.asset(
        picAsset,
        fit: BoxFit.contain,
        height: getScreenHeight(320),
      ),
    );
  }
}

class HeadingText extends StatelessWidget {
  final String text;
  const HeadingText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: textColor,
        fontFamily: fontVNBold,
        fontSize: getScreenHeight(24),
      ),
    );
  }
}
