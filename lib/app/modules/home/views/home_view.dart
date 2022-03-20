import 'package:chillers_hub/app/constant/app_helper_constant.dart';
import 'package:chillers_hub/app/modules/header/views/header_view.dart';
import 'package:chillers_hub/app/modules/home/views/discover_view.dart';
import 'package:chillers_hub/app/utils/desktop/desktop_title_buttons/desktop_title_buttons.dart';
import 'package:chillers_hub/app/utils/responsive/device_responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      flex: 9,
      child: Column(
        children: [
          DesktopTitleButtons(
            showCloseButtons:
                !DeviceResponsive.isDesktop(context) ? true : false,
            showTitle: DeviceResponsive.isMobile(context) ? true : false,
          ),
          //header
          const Padding(
            padding: EdgeInsets.only(
              left: kSpacing,
              right: kSpacing,
            ),
            child: HeaderView(),
          ),
          Expanded(
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              margin: EdgeInsets.only(bottom: size.height * audioPlayerHeight),
              child: SingleChildScrollView(
                controller: controller.mainScrollController.value,
                child: Column(
                  children: const [
                    //discover podcast
                    DiscoverView(),
                    //Top Chiller
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //     left: kSpacing,
                    //     right: kSpacing,
                    //   ),
                    //   child: TopChillersView(),
                    // ),
                    // //Top Episode
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //     left: kSpacing,
                    //     right: kSpacing,
                    //   ),
                    //   child: TopEpisodeView(),
                    // ),
                    // SizedBox(height: kSpacing),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
