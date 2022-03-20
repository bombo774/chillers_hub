import 'package:chillers_hub/app/constant/app_helper_constant.dart';
import 'package:chillers_hub/app/modules/home/controllers/navigation_controller.dart';
import 'package:chillers_hub/app/shared_components/settings_menu.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:unicons/unicons.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Column(
        children: [
          _buildBackButton(),
          _buildHeading(context),
          _buildSettingsMenuNavigation(),
        ],
      ),
    );
  }

  Padding _buildHeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSpacing),
      child: Row(
        children: [
          Text(
            "Settings",
            style: GoogleFonts.poppinsTextTheme().headline6!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                  fontSize: kSubtitleBigFontSize,
                ),
          )
        ],
      ),
    );
  }

  Container _buildBackButton() {
    return Container(
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      padding: const EdgeInsets.only(left: kSpacing, top: kSpacing),
      child: TextButton(
        onPressed: () {
          Get.find<NavigationController>().goBack();
        },
        child: const Icon(UniconsLine.angle_left),
      ),
    );
  }

  Widget _buildSettingsMenuNavigation() {
    return GetBuilder<SettingsController>(
      init: SettingsController(),
      builder: (controller) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: kSpacing),
          child: SettingsMenu(),
        );
      },
    );
  }
}
