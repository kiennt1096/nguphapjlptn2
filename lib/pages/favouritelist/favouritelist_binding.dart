import 'package:get/get.dart';

import '../../core.dart';

class FavouriteListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FavouriteListController>(FavouriteListController());
  }
}
