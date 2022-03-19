import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:chillers_hub/app/constant/app_helper_constant.dart';
import 'package:chillers_hub/app/utils/desktop/desktop_buttons/windows_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

class DesktopTitleButtons extends StatelessWidget {
  const DesktopTitleButtons({
    Key? key,
    required this.showTitle,
    required this.showCloseButtons,
  }) : super(key: key);

  final bool showTitle;
  final bool showCloseButtons;

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb &&
        (Platform.isLinux || Platform.isMacOS || Platform.isWindows)) {
      return SizedBox(
        height: desktopTitleBarSize,
        child: Row(
          children: [
            Offstage(
              offstage: !showTitle,
              child: WindowTitleBarBox(
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Chillers Hub",
                    style: GoogleFonts.chilanka(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                    ),
                  ),
                )),
              ),
            ),
            Expanded(
              child: MoveWindow(),
            ),
            Offstage(
              offstage: !showCloseButtons,
              child: const WindowButtons(),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
