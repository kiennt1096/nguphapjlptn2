import 'package:flutter/material.dart';

import '../../core.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              backgroundColor: backgroundColor,
              valueColor: AlwaysStoppedAnimation(primaryColor),
            ),
            SizedBox(height: getScreenHeight(20)),
            Text(
              "Đang đọc dữ liệu\nVui lòng chờ trong giây lát",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getScreenWidth(16),
                color: primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
