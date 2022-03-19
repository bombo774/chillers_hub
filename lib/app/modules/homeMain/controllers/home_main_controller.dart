import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeMainController extends GetxController {
  Rx<ScrollController> navigationScrollController = ScrollController().obs;
  Rx<ScrollController> mainScrollController = ScrollController().obs;
  Rx<ScrollController> rightScrollController = ScrollController().obs;

  final count = 0.obs;
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
  void increment() => count.value++;
}
