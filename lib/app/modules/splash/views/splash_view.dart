import 'package:chillers_hub/app/utils/desktop/desktop_title_buttons/desktop_title_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const DesktopTitleButtons(
            showCloseButtons: true,
            showTitle: true,
          ),
          Expanded(
            // your image goes here which will take as much height as possible.
            child: SvgPicture.asset(
              "assets/svg/splash – 2.svg",
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
