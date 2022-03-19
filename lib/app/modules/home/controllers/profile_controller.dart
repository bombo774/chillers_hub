import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:chillers_hub/app/constant/storage_constant.dart';
import 'package:chillers_hub/app/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  late final GetStorage _getStorage;
  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    _getStorage = GetStorage();
    isDarkMode.value = _getStorage.read(StorageConstant.isDarkMode);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void changeTheme(BuildContext context) {
    final theme =
        Get.isDarkMode ? AppTheme.lightThemeData : AppTheme.darkThemeData;

    ThemeSwitcher.of(context).changeTheme(theme: theme);
    if (_getStorage.read(StorageConstant.isDarkMode)) {
      _getStorage.write(StorageConstant.isDarkMode, false);
      isDarkMode(false);
    } else {
      _getStorage.write(StorageConstant.isDarkMode, true);
      isDarkMode(true);
    }
  }
}
