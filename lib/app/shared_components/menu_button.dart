import 'package:chillers_hub/app/constant/app_helper_constant.dart';
import 'package:chillers_hub/app/model/menu_button_model.dart';
import 'package:chillers_hub/app/modules/home/controllers/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuButton extends GetView {
  const MenuButton(
      {Key? key,
      this.initialSelected = 0,
      required this.data,
      required this.onSelected})
      : super(key: key);

  final int initialSelected;
  final List<MenuButtonModel> data;
  final Function(int index, MenuButtonModel value) onSelected;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      init: NavigationController(),
      builder: (controller) {
        return Column(
          children: data.asMap().entries.map((e) {
            final index = e.key;
            final data = e.value;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: kContentSpacing),
              child: _Button(
                selected: controller.selectedIndex.value == index,
                data: data,
                onPressed: () {
                  onSelected(index, data);
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class _Button extends StatelessWidget {
  const _Button(
      {Key? key,
      required this.selected,
      required this.data,
      required this.onPressed})
      : super(key: key);
  final bool selected;
  final MenuButtonModel data;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: (!selected)
          ? Colors.transparent
          : Theme.of(context).primaryColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(kBorderRadius),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(kBorderRadius),
        child: Padding(
          padding: const EdgeInsets.all(kSpacing - 5),
          child: Row(
            children: [
              _buildIcon(context),
              const SizedBox(width: kSpacing / 2),
              Expanded(
                child: _buildLabel(context),
              ),
              Padding(
                padding: const EdgeInsets.only(left: kSpacing / 2),
                child: _buildNotification(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(context) {
    return Icon(
      (!selected) ? data.icon : data.activeIcon,
      size: kIconSize,
      color: (!selected) ? Colors.grey : Theme.of(context).primaryColor,
    );
  }

  Widget _buildLabel(context) {
    return Text(
      data.label,
      style: GoogleFonts.poppinsTextTheme().headline6!.copyWith(
            color: (!selected) ? Colors.grey : Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
            fontSize: kSubtitleFontSize,
          ),
    );
  }

  Widget _buildNotification(context) {
    return (data.totalNotification == null || data.totalNotification! <= 0)
        ? Container()
        : Container(
            width: 30,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(kBorderRadius),
                bottomRight: Radius.circular(kBorderRadius),
                bottomLeft: Radius.circular(kBorderRadius),
              ),
            ),
            child: Center(
              child: Text(
                (data.totalNotification! >= 100)
                    ? "99+"
                    : "${data.totalNotification!}",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          );
  }
}
