import 'package:chillers_hub/app/modules/home/controllers/discover_controller.dart';
import 'package:chillers_hub/app/modules/home/controllers/home_controller.dart';
import 'package:chillers_hub/app/modules/home/controllers/navigation_controller.dart';
import 'package:chillers_hub/app/modules/home/controllers/player_controller.dart';
import 'package:chillers_hub/app/modules/home/controllers/profile_controller.dart';
import 'package:chillers_hub/app/modules/home/controllers/recently_played_controller.dart';
import 'package:chillers_hub/app/modules/home/controllers/top_chilla_and_trending_controller.dart';
import 'package:chillers_hub/app/modules/home/controllers/top_chillers_controller.dart';
import 'package:chillers_hub/app/modules/settings/controllers/settings_controller.dart';
import 'package:get/get.dart';

import '../../home/controllers/top_episode_controller.dart';
import '../controllers/home_main_controller.dart';

class HomeMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopEpisodeController>(
      () => TopEpisodeController(),
    );
    Get.lazyPut<TopChillersController>(
      () => TopChillersController(),
    );
    Get.put<DiscoverController>(
      DiscoverController(),
      permanent: true,
    );
    Get.lazyPut<TopChillaAndTrendingController>(
      () => TopChillaAndTrendingController(),
    );
    Get.lazyPut<RecentlyPlayedController>(
      () => RecentlyPlayedController(),
    );
    Get.put<NavigationController>(
      NavigationController(),
      permanent: true,
    );
    Get.put<ProfileController>(
      ProfileController(),
      permanent: true,
    );
    Get.put<PlayerController>(
      PlayerController(),
      permanent: true,
    );
    Get.put<HomeController>(
      HomeController(),
      permanent: true,
    );
    Get.put<HomeMainController>(
      HomeMainController(),
      permanent: true,
    );
    Get.put<SettingsController>(
      SettingsController(),
      permanent: true,
    );
  }
}
