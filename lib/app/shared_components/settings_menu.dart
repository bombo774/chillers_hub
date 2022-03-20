import 'package:chillers_hub/app/constant/app_helper_constant.dart';
import 'package:chillers_hub/app/model/settings_model.dart';
import 'package:chillers_hub/app/modules/settings/controllers/settings_controller.dart';
import 'package:chillers_hub/app/utils/responsive/device_responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsMenu extends StatefulWidget {
  const SettingsMenu({Key? key}) : super(key: key);

  @override
  State<SettingsMenu> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  @override
  Widget build(BuildContext context) {
    return DeviceResponsive(
      mobile: Container(),
      tablet: _buildResponsiveDesktop(),
      desktop: _buildResponsiveDesktop(),
    );
  }

  Widget _buildResponsiveDesktop() {
    return Container(
      alignment: Alignment.topLeft,
      height: 40,
      //color: Colors.green,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: settingsMenu.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = settingsMenu[index];
          final boolSelectedIndex =
              Get.find<SettingsController>().settingsSelectedIndex.value ==
                  index;
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Get.find<SettingsController>()
                      .handleSettingsMenuClick(index, item);
                });
              },
              child: Column(
                children: [
                  ClipPath(
                    clipper: const ShapeBorderClipper(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(kBorderRadius),
                        ),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(right: kSpacing),
                      padding: const EdgeInsets.only(bottom: kSpacing / 2),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: boolSelectedIndex
                                  ? kSelectedColor
                                  : Colors.transparent,
                              width: 5),
                        ),
                      ),
                      child: Text(
                        item.name,
                        style:
                            GoogleFonts.poppinsTextTheme().subtitle1!.copyWith(
                                  fontSize: kSubtitleFontSize,
                                  color: boolSelectedIndex
                                      ? kSelectedColor
                                      : Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .color,
                                ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
