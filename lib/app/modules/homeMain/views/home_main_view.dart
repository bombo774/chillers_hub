import 'package:chillers_hub/app/constant/app_helper_constant.dart';
import 'package:chillers_hub/app/constant/assets.dart';
import 'package:chillers_hub/app/model/event_model.dart';
import 'package:chillers_hub/app/modules/home/controllers/navigation_controller.dart';
import 'package:chillers_hub/app/modules/home/controllers/player_controller.dart';
import 'package:chillers_hub/app/modules/home/views/home_view.dart';
import 'package:chillers_hub/app/modules/home/views/navigation_view.dart';
import 'package:chillers_hub/app/modules/home/views/player_view.dart';
import 'package:chillers_hub/app/modules/homeMain/controllers/home_main_controller.dart';
import 'package:chillers_hub/app/modules/settings/views/settings_view.dart';
import 'package:chillers_hub/app/shared_components/switch_theme_desktop.dart';
import 'package:chillers_hub/app/utils/desktop/desktop_title_buttons/desktop_title_buttons.dart';
import 'package:chillers_hub/app/utils/responsive/device_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeMainView extends GetView {
  const HomeMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: Get.find<NavigationController>().homeScaffoldKey,
        drawer: const NavigationView(),
        drawerEdgeDragWidth:
            !DeviceResponsive.isMobile(context) ? 0.0 : drawerSize,
        body: SlidingUpPanel(
          controller: Get.find<HomeMainController>().pannelController.value,
          minHeight: size.height * audioPlayerHeight,
          maxHeight: size.height,
          parallaxEnabled: true,
          parallaxOffset: 0.1,
          //body switch
          body: Row(
            children: [
              if (!DeviceResponsive.isMobile(context))
                Expanded(
                  flex: 2,
                  child: _buildNavigationBar(),
                ),
              Expanded(
                flex: 9,
                child: Obx(
                  () => _buildMainScreen(context),
                ),
              ),
              if (DeviceResponsive.isDesktop(context))
                _buildRightSide(context, size),
            ],
          ),
          panelBuilder: (scrollController) => GlassmorphicContainer(
            height: double.maxFinite,
            width: double.maxFinite,
            blur: 20,
            alignment: Alignment.bottomCenter,
            border: 2,
            linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.1),
                Theme.of(context).primaryColor.withOpacity(0.05),
              ],
              stops: const [
                0.1,
                1,
              ],
            ),
            borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.0),
                Theme.of(context).primaryColor.withOpacity(0.0),
              ],
            ),
            borderRadius: 0,
            child: PlayerView(
              scrollController: scrollController,
            ),
          ),
          color: Colors.transparent,
          boxShadow: const [],
        ),
      ),
    );
  }

  //build right Navigation
  Widget _buildNavigationBar() {
    return Column(
      children: const [
        DesktopTitleButtons(
          showCloseButtons: false,
          showTitle: true,
        ),
        NavigationView(),
      ],
    );
  }

  //build main Screen
  Widget _buildMainScreen(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        //screens
        if (Get.find<NavigationController>().selectedIndex.value == 0)
          const HomeView(),
        if (Get.find<NavigationController>().selectedIndex.value == 1)
          Container(),
        if (Get.find<NavigationController>().selectedIndex.value == 2)
          Container(),
        if (Get.find<NavigationController>().selectedIndex.value == 3)
          Container(),
        if (Get.find<NavigationController>().selectedIndex.value == 4)
          const SettingsView(),
      ],
    );
  }

  //build right side widget
  Expanded _buildRightSide(BuildContext context, Size size) {
    return Expanded(
      flex: 3,
      child: Container(
        margin: EdgeInsets.only(bottom: size.height * audioPlayerHeight),
        child: Column(
          children: [
            const DesktopTitleButtons(
              showCloseButtons: true,
              showTitle: false,
            ),
            //switch Theme desktop
            const SwtichThemeDesktop(),
            Expanded(
              child: SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: SingleChildScrollView(
                  controller: Get.find<HomeMainController>()
                      .rightScrollController
                      .value,
                  child: ListView.builder(
                    itemCount: events.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = events[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: kSpacing - 5,
                          vertical: kSpacing - 5,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(kBorderRadius),
                        ),
                        child: Material(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(kBorderRadius),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(kBorderRadius),
                                        topRight:
                                            Radius.circular(kBorderRadius),
                                      ),
                                      child: SizedBox(
                                        height: 200,
                                        child: BlurHash(
                                          hash: "L5H2EC=PM+yV0g-mq.wG9c010J}I",
                                          image: item.image,
                                          imageFit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            Theme.of(context).primaryColor,
                                            Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.5),
                                            Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.1),
                                          ],
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft:
                                              Radius.circular(kBorderRadius),
                                          topRight:
                                              Radius.circular(kBorderRadius),
                                        ),
                                      ),
                                    ),
                                    Positioned.directional(
                                      textDirection: Directionality.of(context),
                                      start: 12,
                                      bottom: 12,
                                      child: Text(
                                        item.title,
                                        style: GoogleFonts.poppinsTextTheme()
                                            .subtitle1!
                                            .copyWith(
                                              fontSize: kSubtitleBigFontSize,
                                              color: Colors.white,
                                            ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                                ListTile(
                                  dense: true,
                                  leading: Image.asset(
                                    Assets.djPin,
                                    scale: 4,
                                  ),
                                  title: Text(
                                    '22 June | 22:00 - 4:00',
                                    style: GoogleFonts.poppinsTextTheme()
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: kSubtitleFontSize,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color,
                                        ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Text(
                                    '2202, Marion St. Bass Hill, Middelburg',
                                    style: GoogleFonts.poppinsTextTheme()
                                        .caption!
                                        .copyWith(
                                          fontSize: kCaptionFontSize,
                                          color: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .color,
                                        ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  trailing: Text(
                                    '2.3 km ' + "away",
                                    style: GoogleFonts.poppinsTextTheme()
                                        .caption!
                                        .copyWith(
                                          fontSize: kCaptionFontSize,
                                          color: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .color,
                                        ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
