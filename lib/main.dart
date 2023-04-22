import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nguphapn2_app/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: mainTitles,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: fontVN,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      transitionDuration: const Duration(microseconds: 230),
      initialRoute:
          GetStorage().hasData("skipSplash") ? Routes.main : Routes.splash,
      initialBinding:
          GetStorage().hasData("skipSplash") ? MainBinding() : SplashBinding(),
      getPages: AppPage.routes,
      builder: EasyLoading.init(),
    );
  }
}
