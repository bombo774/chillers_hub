import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeMainController extends GetxController with StateMixin {
  Rx<ScrollController> navigationScrollController = ScrollController().obs;
  Rx<ScrollController> mainScrollController = ScrollController().obs;
  Rx<ScrollController> rightScrollController = ScrollController().obs;
  final panelOpened = false.obs;
  var pannelController = PanelController().obs;
  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    Future.delayed(const Duration(seconds: 5), () {
      change(null, status: RxStatus.success());
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
