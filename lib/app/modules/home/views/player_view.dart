import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:chillers_hub/app/constant/app_helper_constant.dart';
import 'package:chillers_hub/app/modules/home/controllers/player_controller.dart';
import 'package:chillers_hub/app/modules/homeMain/controllers/home_main_controller.dart';
import 'package:chillers_hub/app/utils/logging/logging.dart';
import 'package:chillers_hub/app/utils/responsive/device_responsive.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class PlayerView extends GetView {
  const PlayerView({Key? key, required this.scrollController})
      : super(key: key);
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.transparent,
      child: ListView(
        controller: scrollController,
        children: [
          //mp3 player controls
          Obx(() {
            return Container(
              padding: const EdgeInsets.only(left: kSpacing, right: kSpacing),
              height: (size.height * audioPlayerHeight),
              child: Column(
                children: [
                  dragDot(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // episode title
                      if (!DeviceResponsive.isMobile(context))
                        nowPlaying(size, context),
                      if (!DeviceResponsive.isMobile(context))
                        const SizedBox(width: kSpacing * 2),
                      // player previous/play/pause
                      playerControls(context),
                    ],
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }

  Flexible playerControls(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: !DeviceResponsive.isMobile(context) ? 500 : 1000,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //shuffle
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10000),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10000),
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          EvaIcons.shuffle,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: kSpacing),
                //previous
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10000),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10000),
                      onTap: () {
                        Get.find<PlayerController>().previous();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          EvaIcons.skipBack,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: kSpacing),
                //play/pause
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10000),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10000),
                      onTap: () {
                        if (!Get.find<PlayerController>()
                                .isPlayingAudio
                                .value &&
                            !Get.find<PlayerController>()
                                .audioIsLoadingOrBuffering
                                .value) {
                          Get.find<PlayerController>().playAudio();
                        } else {
                          if (!Get.find<PlayerController>()
                              .audioIsLoadingOrBuffering
                              .value) {
                            Get.find<PlayerController>().pauseAudio();
                          }
                        }
                      },
                      child: !Get.find<PlayerController>()
                              .audioIsLoadingOrBuffering
                              .value
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                !Get.find<PlayerController>()
                                        .isPlayingAudio
                                        .value
                                    ? UniconsLine.play
                                    : UniconsLine.pause,
                                size: kIconSize,
                              ),
                            )
                          : SpinKitFadingCircle(
                              size: 25,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                    ),
                  ),
                ),
                const SizedBox(width: kSpacing),
                //next
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10000),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10000),
                      onTap: () {
                        Get.find<PlayerController>().next();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          EvaIcons.skipForward,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: kSpacing),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10000),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10000),
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          EvaIcons.repeat,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: kContentSpacing),
            //progrss bar
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: ProgressBar(
                progress: Get.find<PlayerController>().audioStreamPostion.value,
                buffered:
                    Get.find<PlayerController>().audioBufferdPostion.value,
                total: Get.find<PlayerController>().audioDuration.value,
                barHeight: 5,
                timeLabelLocation: TimeLabelLocation.sides,
                onSeek: (duration) {
                  Get.find<PlayerController>().seek(duration);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Flexible nowPlaying(Size size, BuildContext context) {
    return Flexible(
      flex: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(kSpacing / 2),
            decoration: BoxDecoration(
              color: Theme.of(Get.context!)
                  .colorScheme
                  .onSecondary
                  .withOpacity(0.2),
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius),
              child: Image.network(
                "https://i.ytimg.com/vi/mw6H6lCNWt4/mqdefault.jpg",
                height: (size.height * audioPlayerHeight) / 2,
              ),
            ),
          ),
          const SizedBox(width: kContentSpacing),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Get.find<PlayerController>().audioTitle.value,
                style: GoogleFonts.poppinsTextTheme().subtitle1!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                      fontSize: kSubtitleBigFontSize,
                    ),
              ),
              SizedBox(
                width: size.width * .15,
                child: Text(
                  "Episode 335 I City of Tswane Protests, Uber Eats,Female DJs,EFF, The Braai Show, Major  League DJz",
                  style: GoogleFonts.poppinsTextTheme().labelSmall!.copyWith(
                        fontSize: kCaptionFontSize,
                        color:
                            Theme.of(Get.context!).textTheme.labelSmall!.color,
                      ),
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding dragDot(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSpacing / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            borderRadius: BorderRadius.circular(kBorderRadius),
            child: InkWell(
              onTap: () {
                Get.find<HomeMainController>().panelOpened.value
                    ? Get.find<HomeMainController>()
                        .pannelController
                        .value
                        .close()
                    : Get.find<HomeMainController>()
                        .pannelController
                        .value
                        .open();

                //
                Get.find<HomeMainController>().panelOpened(
                    !Get.find<HomeMainController>().panelOpened.value);
              },
              borderRadius: BorderRadius.circular(kBorderRadius),
              child: Container(
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  EvaIcons.moreHorizontalOutline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
