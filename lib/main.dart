import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:chillers_hub/app/constant/storage_constant.dart';
import 'package:chillers_hub/app/initial_binding.dart';
import 'package:chillers_hub/app/theme/app_theme.dart';
import 'package:chillers_hub/app/utils/my_custom_scroll_behavior.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';
import 'app/routes/app_pages.dart';

void main() async {
  // Here we set the URL strategy for our web app.
  // It is safe to call this function when running on mobile or desktop as well.
  setPathUrlStrategy();
  Paint.enableDithering = true;
  bool isDarkMode = await getUserTheme();
  WidgetsFlutterBinding.ensureInitialized();
  await onInit();
  runApp(
    ThemeProvider(
      initTheme: isDarkMode ? AppTheme.darkThemeData : AppTheme.lightThemeData,
      builder: (context, myTheme) {
        return GetMaterialApp(
          title: "Chillers Hub",
          scrollBehavior: MyCustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          initialBinding: InitialBinding(),
          getPages: AppPages.routes,
          theme: myTheme,
        );
      },
    ),
  );
}

onInit() async {
  setDesktopProperties();
}

void setDesktopProperties() {
  if (!kIsWeb && (Platform.isLinux || Platform.isMacOS || Platform.isWindows)) {
    doWhenWindowReady(() {
      final win = appWindow;
      const initialSize = Size(940, 720);
      win.minSize = const Size(412, 667);
      win.size = initialSize;
      win.alignment = Alignment.center;
      win.title = "Chillers Hub";
      win.show();
    });
  }
}

getUserTheme() async {
  await GetStorage.init();
  final _getStorage = GetStorage();
  bool themeMode = _getStorage.read(StorageConstant.isDarkMode) ?? false;
  _getStorage.write(StorageConstant.isDarkMode, themeMode);
  return themeMode;
}

Future<void> toggleFullScreen() async {
  if (!kIsWeb && (Platform.isLinux || Platform.isMacOS || Platform.isWindows)) {
    await DesktopWindow.toggleFullScreen();
  }
}
