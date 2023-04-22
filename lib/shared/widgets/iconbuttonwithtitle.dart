import 'package:flutter/material.dart';

import '../../core.dart';

class IconButtonWithTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function press;
  const IconButtonWithTitle({
    Key? key,
    required this.icon,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getScreenHeight(70),
          width: getScreenHeight(70),
          child: TextButton(
            onPressed: () {
              press();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(btnColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(getScreenHeight(10)))),
            ),
            child: Icon(
              icon,
              color: primaryColor,
            ),
          ),
        ),
        SizedBox(height: getScreenHeight(8)),
        Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: getScreenHeight(14),
            fontFamily: fontVNBold,
          ),
        ),
      ],
    );
  }
}
