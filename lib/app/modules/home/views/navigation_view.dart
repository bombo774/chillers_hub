import 'package:chillers_hub/app/constant/app_helper_constant.dart';

import 'package:chillers_hub/app/modules/home/controllers/navigation_controller.dart';
import 'package:chillers_hub/app/shared_components/main_menu.dart';
import 'package:chillers_hub/app/shared_components/user_profile.dart';
import 'package:chillers_hub/app/utils/responsive/device_responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeviceResponsive(
      mobile: _buildMobile(context),
      tablet: _buildTabletDesktop(context),
      desktop: _buildTabletDesktop(context),
    );
  }

  Widget _buildNavigation() {
    return Column(
      children: [
        //user profile
        UserProfile(
          data: controller.dataProfile,
          onPresseed: controller.onPressedProfile,
        ),
        const SizedBox(height: kSpacing - 5),
        //main menu
        MainMenu(
          onSelected: controller.onSelectedMainMenu,
        ),
        const Divider(
          indent: 20,
          thickness: 1,
          endIndent: 20,
          height: 60,
        ),
        //
      ],
    );
  }

  Widget _buildMobile(context) {
    final size = MediaQuery.of(context).size;
    return GlassmorphicContainer(
      width: size.width / 1.5,
      height: size.height,
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
      child: _buildNavigation(),
    );
  }

  Widget _buildTabletDesktop(context) {
    return GlassmorphicFlexContainer(
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
      child: _buildNavigation(),
    );
  }
}
