import 'package:chillers_hub/app/constant/app_helper_constant.dart';
import 'package:chillers_hub/app/model/youtube_videos/youtube_video_model.dart';
import 'package:chillers_hub/app/modules/home/controllers/discover_controller.dart';
import 'package:chillers_hub/app/utils/logging/logging.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class DiscoverView extends GetView<DiscoverController> {
  const DiscoverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: kSpacing, top: kSpacing),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discover",
                    style: GoogleFonts.poppinsTextTheme().headline6!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8,
                          fontSize: kSubtitleBigFontSize,
                        ),
                  ),
                  Row(
                    children: [
                      Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Icon(
                                EvaIcons.arrowIosBackOutline,
                                size: kIconSize,
                                color: Theme.of(context).primaryColor,
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
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(kBorderRadius),
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                                borderRadius:
                                    BorderRadius.circular(kBorderRadius),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Icon(
                                  EvaIcons.arrowIosForwardOutline,
                                  size: kIconSize,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _buildHeading(context),
            const SizedBox(height: kSpacing),
            controller.youtubeVideos.isNotEmpty
                ? Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 260,
                          margin: const EdgeInsets.only(bottom: 20),
                          child: NotificationListener<ScrollNotification>(
                            onNotification: (notification) {
                              if (!controller.isLoadingData.value &&
                                  notification.metrics.pixels ==
                                      notification.metrics.maxScrollExtent) {
                                loggerNoStack.i("scrolled to end");
                                controller.isLoadingData.value = true;
                                controller.getVideos();
                              }

                              return true;
                            },
                            child: ListView.builder(
                              controller: controller.scrollController.value,
                              itemCount: controller.youtubeVideos.length,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final item = controller.youtubeVideos[index];

                                return _buildNormalVideo(index, item, context);
                              },
                            ),
                          ),
                        ),
                      ),
                      Offstage(
                        offstage: !controller.isLoadingData.value,
                        child: Padding(
                          padding: const EdgeInsets.all(kSpacing),
                          child: Center(
                            child: SpinKitFadingCircle(
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Padding _buildHeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kSpacing, right: kSpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            controller.seletedChannelValue.value,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: GoogleFonts.poppinsTextTheme().headline6!.copyWith(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                  fontSize: 16,
                ),
          ),
          Icon(
            EvaIcons.arrowIosDownwardOutline,
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            size: kIconSize,
          ),
        ],
      ),
    );
  }

  Container _buildNormalVideo(int index, Item item, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: index == 0 ? 20 : 0, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(kBorderRadius),
            child: InkWell(
              borderRadius: BorderRadius.circular(kBorderRadius),
              onTap: () {},
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 320,
                        height: 180,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(kBorderRadius),
                            topRight: Radius.circular(kBorderRadius),
                          ),
                          child: BlurHash(
                            hash: "L5H2EC=PM+yV0g-mq.wG9c010J}I",
                            image: item.snippet!.thumbnails!.medium!.url ?? "",
                          ),
                        ),
                      ),
                      Container(
                        height: 180,
                        width: 320,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Theme.of(context).primaryColor,
                              Theme.of(context).primaryColor.withOpacity(0.5),
                              Theme.of(context).primaryColor.withOpacity(0.1),
                            ],
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(kBorderRadius),
                            topRight: Radius.circular(kBorderRadius),
                          ),
                        ),
                      ),
                      Positioned.directional(
                        textDirection: Directionality.of(context),
                        start: 12,
                        bottom: 12,
                        child: SizedBox(
                          width: 200,
                          child: Text(
                            item.snippet!.title!,
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontSize: kSubtitleFontSize,
                                      color: Colors.white,
                                    ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 320,
                    child: ListTile(
                      dense: true,
                      leading: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            UniconsLine.play,
                            color: Theme.of(context).primaryColor,
                            size: kIconSize,
                          ),
                        ),
                      ),
                      title: Text(
                        item.snippet!.description!,
                        style: GoogleFonts.poppinsTextTheme()
                            .subtitle1!
                            .copyWith(
                              fontSize: kSubtitleFontSize,
                              color:
                                  Theme.of(context).textTheme.subtitle1!.color,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        item.snippet!.liveBroadcastContent! != "none"
                            ? item.snippet!.liveBroadcastContent!
                            : "",
                        style: GoogleFonts.poppinsTextTheme().caption!.copyWith(
                              fontSize: kCaptionFontSize,
                              color: Theme.of(context).textTheme.caption!.color,
                            ),
                      ),
                      trailing: Column(
                        children: [
                          Text(
                            timeago
                                .format(item.snippet!.publishedAt!,
                                    locale: 'en_short')
                                .replaceAll("~", ""),
                            style: GoogleFonts.poppinsTextTheme()
                                .caption!
                                .copyWith(
                                  fontSize: kCaptionFontSize,
                                  color: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .color,
                                ),
                          ),
                          InkWell(
                            onTap: () {
                              //open youtube link
                              Get.find<DiscoverController>()
                                  .openYoutubeVideoLink(item.id!.videoId!);
                            },
                            child: Icon(
                              FontAwesomeIcons.youtube,
                              size: kIconSize,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
