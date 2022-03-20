import 'package:chillers_hub/app/model/settings_model.dart';
import 'package:chillers_hub/app/utils/logging/logging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  var settingsSelectedIndex = 0.obs;
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

  void handleSettingsMenuClick(int index, SettingsModel settingsModel) {
    loggerNoStack.i("clicked on $index and name ${settingsModel.name}");
    settingsSelectedIndex(index);
  }
}
