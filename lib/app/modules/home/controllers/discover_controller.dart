import 'package:chillers_hub/app/constant/assets.dart';
import 'package:chillers_hub/app/model/youtube_videos/youtube_video_model.dart';
import 'package:chillers_hub/app/modules/home/providers/discover_provider.dart';
import 'package:chillers_hub/app/utils/logging/logging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DiscoverController extends GetxController {
  RxList<Item> youtubeVideos = <Item>[].obs;
  var nextPageToken = "".obs;
  var isLoadingData = false.obs;
  var isRunningApi = false.obs;
  Rx<ScrollController> scrollController = ScrollController().obs;
  var discoverPodcastListKey = GlobalKey<AnimatedListState>().obs;
  String? selectedValue;
  var seletedChannelValue = "All".obs;
  List<String> items = [
    'ALL',
    'PODCAST AND CHILL WITH MACG',
    'CELEBRITY EDITION',
    'PODCARST AND RIDE',
    'CITY GIRLS WITH TEBOGO THOBEJANE',
    'AFTER CHILLERS WITH DJ JAWZ',
    'ON THE TABLE PODCAST',
    'THE QUEER WAY OF LIFE WITH BUJY',
    'BLACK FRIDAY',
    'THE HANG OUT',
    'THE CHILLERS CLUB',
  ].obs;

  @override
  void onInit() {
    super.onInit();
    //getVideos();
    getVideosFromAssets();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future getVideos() async {
    isLoadingData(true);
    DiscoverProvider()
        .getYoutubeVideos(
      key: "AIzaSyDSPGwAOkBZkCgsNv9wrhsPPTwXZhCEU9A",
      order: "date",
      maxResults: 20,
      pageToken: nextPageToken.value,
    )
        .then(
      (response) {
        loggerNoStack.i(response);
        YouTubeVideoModel model = YouTubeVideoModel.fromJson(response);
        loggerNoStack.i("next Page token ${model.nextPageToken}");
        if (model.nextPageToken != null) {
          nextPageToken(model.nextPageToken);
          loggerNoStack.i("next page token saved ${nextPageToken.value}");
        }
        if (model.items != null) {
          List<Item>? items = model.items;

          for (Item item in items!) {
            youtubeVideos.add(item);
          }
        }

        isLoadingData(false);
      },
    ).catchError((onError) {
      isLoadingData(false);
      logger.e(onError);
    });
  }

  void openYoutubeVideoLink(String videoId) async {
    String _url = "https://www.youtube.com/watch?v=$videoId";
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  Future<void> getVideosFromAssets() async {
    loggerNoStack.i("Entered get videos");

    YouTubeVideoModel model = YouTubeVideoModel.fromJson(Assets.youTubeVideos);
    loggerNoStack.i("videos $model");
    if (model.items != null) {
      List<Item>? items = model.items;
      for (Item item in items!) {
        youtubeVideos.add(item);
      }
    }
  }
}
