import 'package:get/get.dart';

import '../../core.dart';

class MondaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MondaiController>(MondaiController());
  }
}
