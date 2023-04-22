import 'package:get/get.dart';
import 'package:nguphapn2_app/core.dart';

class GrammarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GrammarController>(GrammarController());
  }
}
