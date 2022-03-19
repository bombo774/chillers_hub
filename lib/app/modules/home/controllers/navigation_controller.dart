import 'package:chillers_hub/app/model/menu_button_model.dart';
import 'package:chillers_hub/app/model/user_profile_model.dart';
import 'package:chillers_hub/app/utils/logging/logging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final UserProfileModel dataProfile = UserProfileModel(
    image: const NetworkImage(
        "https://images.pexels.com/photos/871495/pexels-photo-871495.jpeg?cs=srgb&dl=pexels-godisable-jacob-871495.jpg&fm=jpg"),
    name: 'Godisable Jacob',
    userType: 'Member',
  );

  var selectedIndex = 0.obs;
  var isExpanded = false.obs;
  final GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    super.onInit();
    goToPage();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void navigationItemOnTap(int index) {
    selectedIndex(index);
  }

  //home open dawer
  void homeOpenDrawer() {
    homeScaffoldKey.currentState!.openDrawer();
  }

  void onPressedProfile() {}

  void onSelectedMainMenu(int index, MenuButtonModel value) {
    loggerNoStack.i("Selected $index ${value.label} on  main menu");
    selectedIndex(index);
    if (index == 0) {
      Get.toNamed("/discover");
    } else if (index == 4) {
      Get.toNamed("/settings");
    }
  }

  void goToPage() {
    if (selectedIndex.value != 4 && Get.currentRoute.contains("/settings")) {
      loggerNoStack.i(
          "incorrect displayed fixing display for route ${Get.currentRoute}");
      selectedIndex(4);
    }
  }
}
