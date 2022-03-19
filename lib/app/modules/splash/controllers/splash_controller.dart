import 'package:chillers_hub/app/utils/logging/logging.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    loggerNoStack.i("Enter SplashController.onInit");
    Future.delayed(const Duration(seconds: 3), (() {
      Get.offAllNamed("/login");
    }));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // toggleFullScreen();
  }

  Future<void> toggleFullScreen() async {
    if (!kIsWeb &&
        (Platform.isLinux || Platform.isMacOS || Platform.isWindows)) {
      await DesktopWindow.toggleFullScreen();
    }
  }
}
