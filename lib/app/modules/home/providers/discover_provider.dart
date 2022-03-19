import 'dart:convert';

import 'package:chillers_hub/app/model/youtube_videos/youtube_video_model.dart';
import 'package:chillers_hub/app/utils/logging/logging.dart';
import 'package:get/get.dart';

class DiscoverProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return YouTubeVideoModel.fromJson(map);
      if (map is List) {
        return map.map((item) => YouTubeVideoModel.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'https://youtube.googleapis.com/youtube/v3';
  }

  Future<dynamic> getYoutubeVideos({
    required String key,
    required String order,
    required int maxResults,
    required String pageToken,
  }) async {
    String url =
        'https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=UC7BXdXFxVgMPKmBeDgx2QrQ&maxResults=$maxResults&order=$order&pageToken=$pageToken&key=$key';

    loggerNoStack.i("url $url");
    final response = await get(url);
    return jsonDecode(jsonEncode(response.body));
  }

  Future<Response<YouTubeVideoModel>> postYoutubeVideo(
          YouTubeVideoModel youtubevideo) async =>
      await post('youtubevideo', youtubevideo);
  Future<Response> deleteYoutubeVideo(int id) async =>
      await delete('youtubevideo/$id');
}
