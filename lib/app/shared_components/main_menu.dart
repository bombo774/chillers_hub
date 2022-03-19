import 'package:chillers_hub/app/model/menu_button_model.dart';
import 'package:chillers_hub/app/shared_components/menu_button.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key, required this.onSelected}) : super(key: key);

  final Function(int index, MenuButtonModel value) onSelected;

  @override
  Widget build(BuildContext context) {
    return MenuButton(
      data: [
        MenuButtonModel(
          activeIcon: EvaIcons.compass,
          icon: EvaIcons.compassOutline,
          label: "Discover",
        ),
        MenuButtonModel(
          activeIcon: EvaIcons.bell,
          icon: EvaIcons.bellOutline,
          label: "Notifications",
          totalNotification: 100,
        ),
        MenuButtonModel(
          activeIcon: EvaIcons.shoppingCart,
          icon: EvaIcons.shoppingCartOutline,
          label: "Merch",
          totalNotification: 20,
        ),
        MenuButtonModel(
          activeIcon: Icons.receipt_long,
          icon: Icons.receipt_long_outlined,
          label: "Events",
          totalNotification: 1,
        ),
        MenuButtonModel(
          activeIcon: EvaIcons.settings,
          icon: EvaIcons.settings2Outline,
          label: "Settings",
        ),
      ],
      onSelected: onSelected,
    );
  }
}
