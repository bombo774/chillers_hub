import 'package:chillers_hub/app/constant/app_helper_constant.dart';
import 'package:chillers_hub/app/modules/home/controllers/navigation_controller.dart';
import 'package:chillers_hub/app/utils/responsive/device_responsive.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

import '../controllers/header_controller.dart';

class HeaderView extends GetView<HeaderController> {
  const HeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kSpacing / 2, bottom: kSpacing / 2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //  menu button
              if (DeviceResponsive.isMobile(context))
                IconButton(
                  onPressed: () {
                    if (Get.find<NavigationController>().selectedIndex.value ==
                        0) {
                      Get.find<NavigationController>().homeOpenDrawer();
                    }
                  },
                  icon: const Icon(EvaIcons.menu2Outline),
                ),
              if (DeviceResponsive.isMobile(context))
                const SizedBox(width: kSpacing),
              Flexible(
                child: Container(
                  // constraints: const BoxConstraints(
                  //   maxWidth: 600,
                  //   maxHeight: 100,
                  // ),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onSaved: (value) {},
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: GoogleFonts.poppinsTextTheme()
                          .caption!
                          .copyWith(
                            color: Theme.of(context).textTheme.caption!.color,
                          ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(kBorderRadius),
                        ),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(kBorderRadius),
                        ),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(kBorderRadius),
                        ),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      prefixIcon: Icon(
                        EvaIcons.search,
                        color: Theme.of(context).primaryColor.withOpacity(.5),
                        size: kIconSize,
                      ),
                      contentPadding: const EdgeInsets.only(
                        left: kSpacing,
                        right: kSpacing,
                      ),
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                    cursorHeight: 20,
                    validator: (value) {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
