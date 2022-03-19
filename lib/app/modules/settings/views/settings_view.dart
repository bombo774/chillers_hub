import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
          Container(
            child: Row(
              children: [
                Icon(UniconsLine.angle_left),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
