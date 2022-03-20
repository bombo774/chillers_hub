import 'package:chillers_hub/app/modules/home/controllers/discover_controller.dart';
import 'package:chillers_hub/app/modules/home/controllers/player_controller.dart';
import 'package:chillers_hub/app/modules/settings/controllers/settings_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(),
      permanent: true,
    );
    Get.put<PlayerController>(
      PlayerController(),
      permanent: true,
    );
    Get.put<DiscoverController>(
      DiscoverController(),
      permanent: true,
    );
    Get.put<SettingsController>(
      SettingsController(),
      permanent: true,
    );
  }
}
