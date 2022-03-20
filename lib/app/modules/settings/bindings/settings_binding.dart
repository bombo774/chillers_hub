import 'package:chillers_hub/app/modules/home/controllers/home_controller.dart';
import 'package:chillers_hub/app/modules/home/controllers/player_controller.dart';
import 'package:chillers_hub/app/modules/homeMain/controllers/home_main_controller.dart';
import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SettingsController>(
      SettingsController(),
      permanent: true,
    );
    Get.put<HomeMainController>(
      HomeMainController(),
      permanent: true,
    );
    Get.put<HomeController>(
      HomeController(),
      permanent: true,
    );
    Get.put<PlayerController>(
      PlayerController(),
      permanent: true,
    );
  }
}
