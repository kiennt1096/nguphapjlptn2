import 'package:get/get.dart';
import 'package:nguphapn2_app/core.dart';

class ListGrammarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ListGrammarController>(ListGrammarController());
  }
}
