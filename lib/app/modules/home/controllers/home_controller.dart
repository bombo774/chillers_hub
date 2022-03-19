import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<ScrollController> navigationScrollController = ScrollController().obs;
  Rx<ScrollController> mainScrollController = ScrollController().obs;
  Rx<ScrollController> rightScrollController = ScrollController().obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
