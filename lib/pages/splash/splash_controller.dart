import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';

import '../../core.dart';

class SplashController extends GetxController {
  var downloadState = 0.obs;
  var downloadMondaiState = 0.obs;
  var dlBtnTitle = download.obs;

  final skipSplash = GetStorage();

  void downloadFunction() async {
    switch (downloadState.value) {
      case 6:
        if (downloadMondaiState.value == 6) {
          skipSplash.write("skipSplash", "ok");
          Get.toNamed(Routes.main);
        }
        break;
      default:
        downloadData();
        downloadMondai();
        break;
    }
  }

  Future<void> downloadData() async {
    final pathReference =
        FirebaseStorage.instance.ref().child("data/finalnguphapdata-3.json");
    final appDocDir = await getApplicationDocumentsDirectory();
    final filePath = "${appDocDir.path}/finalnguphapdata.json";
    final file = File(filePath);

    final downloadTask = pathReference.writeToFile(file);
    downloadTask.snapshotEvents.listen((event) async {
      switch (event.state) {
        case TaskState.running:
          downloadState.value = 1;
          EasyLoading.show(status: runningState);
          dlBtnTitle.value = runningState;
          break;
        case TaskState.paused:
          downloadState.value = 2;
          dlBtnTitle.value = pausedState;
          break;
        case TaskState.success:
          EasyLoading.dismiss();
          dlBtnTitle.value = doneState;
          EasyLoading.showSuccess(successState);
          downloadState.value = 6;
          break;
        case TaskState.canceled:
          downloadState.value = 4;
          dlBtnTitle.value = cancelState;
          break;
        case TaskState.error:
          downloadState.value = 5;
          EasyLoading.showError(errorState);
          dlBtnTitle.value = errorState;
          break;
      }
    });
  }

  Future<void> downloadMondai() async {
    final pathReference =
        FirebaseStorage.instance.ref().child("data/datamondai_final.json");
    final appDocDir = await getApplicationDocumentsDirectory();
    final filePath = "${appDocDir.path}/datamondai_final.json";
    final file = File(filePath);

    final downloadTask = pathReference.writeToFile(file);
    downloadTask.snapshotEvents.listen((event) async {
      switch (event.state) {
        case TaskState.running:
          downloadMondaiState.value = 1;
          EasyLoading.show(status: runningState);
          dlBtnTitle.value = runningState;
          break;
        case TaskState.paused:
          downloadMondaiState.value = 2;
          dlBtnTitle.value = pausedState;
          break;
        case TaskState.success:
          EasyLoading.dismiss();
          dlBtnTitle.value = doneState;
          EasyLoading.showSuccess(successState);
          downloadMondaiState.value = 6;
          break;
        case TaskState.canceled:
          downloadMondaiState.value = 4;
          dlBtnTitle.value = cancelState;
          break;
        case TaskState.error:
          downloadMondaiState.value = 5;
          EasyLoading.showError(errorState);
          dlBtnTitle.value = errorState;
          break;
      }
    });
  }
}
