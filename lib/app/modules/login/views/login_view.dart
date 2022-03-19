import 'package:chillers_hub/app/constant/app_helper_constant.dart';
import 'package:chillers_hub/app/modules/login/views/form_login_view.dart';
import 'package:chillers_hub/app/modules/login/views/qr_login_view.dart';
import 'package:chillers_hub/app/utils/desktop/desktop_title_buttons/desktop_title_buttons.dart';
import 'package:chillers_hub/app/utils/responsive/device_responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const DesktopTitleButtons(
            showCloseButtons: true,
            showTitle: true,
          ),
          Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: kSpacing,
                        right: kSpacing,
                      ),
                      padding: const EdgeInsets.only(
                          left: kSpacing,
                          right: kSpacing,
                          top: kSpacing * 2,
                          bottom: kSpacing * 2),
                      constraints: const BoxConstraints(
                        maxWidth: 800,
                        minHeight: 200,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 5,
                            child: FormLoginView(),
                          ),
                          if (!DeviceResponsive.isMobile(context))
                            const Expanded(
                              flex: 4,
                              child: QrLoginView(),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
