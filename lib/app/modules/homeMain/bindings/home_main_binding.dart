import 'package:chillers_hub/app/modules/home/controllers/discover_controller.dart';
import 'package:chillers_hub/app/modules/home/controllers/home_controller.dart';
import 'package:chillers_hub/app/modules/home/controllers/navigation_controller.dart';
import 'package:chillers_hub/app/modules/home/controllers/player_controller.dart';
import 'package:chillers_hub/app/modules/home/controllers/profile_controller.dart';
import 'package:chillers_hub/app/modules/home/controllers/recently_played_controller.dart';
import 'package:chillers_hub/app/modules/home/controllers/top_chilla_and_trending_controller.dart';
import 'package:chillers_hub/app/modules/home/controllers/top_chillers_controller.dart';
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
    Get.lazyPut<DiscoverController>(
      () => DiscoverController(),
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
    Get.lazyPut<PlayerController>(
      () => PlayerController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<HomeMainController>(
      () => HomeMainController(),
    );
  }
}