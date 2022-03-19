import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:chillers_hub/app/constant/app_helper_constant.dart';
import 'package:chillers_hub/app/modules/home/controllers/profile_controller.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SwtichThemeDesktop extends GetView {
  const SwtichThemeDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kSpacing / 2, bottom: kSpacing / 2),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                ThemeSwitcher(
                  builder: (context) {
                    return GetBuilder<ProfileController>(
                      builder: (controller) => MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: IconButton(
                          onPressed: () {
                            controller.changeTheme(context);
                          },
                          icon: !controller.isDarkMode.value
                              ? Icon(
                                  EvaIcons.moonOutline,
                                  color: Theme.of(context).primaryColor,
                                  size: kIconSize,
                                )
                              : Icon(
                                  EvaIcons.sunOutline,
                                  color: Theme.of(context).primaryColor,
                                  size: kIconSize,
                                ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
