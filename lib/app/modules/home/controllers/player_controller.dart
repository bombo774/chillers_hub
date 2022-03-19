import 'package:chillers_hub/app/utils/logging/logging.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PlayerController extends GetxController {
  var pannelController = PanelController().obs;
  final player = AudioPlayer();
  final panelOpened = false.obs;
  var audioTitle = "Episode 334".obs;
  var audioDuration = const Duration().obs;
  var audioStreamPostion = const Duration().obs;
  var audioBufferdPostion = const Duration().obs;
  var isPlayingAudio = false.obs;
  var audioIsLoadingOrBuffering = true.obs;
  var suffleEnabled = false.obs;
  var repeat = false.obs;

  @override
  void onInit() {
    super.onInit();
    _registerPlayerStateStreamListener();
    _registerPlayerDurationListener();
    _registerPlayerPositionStream();
    _registerPlayerBufferedPositionStream();
    _registerIcyMetadataStream();
    _registerPlayingStream();
    _registerVolumeStream();
    _registerPlaybackEventStream();
    _processingStateStream();
    initializeAudioPlayer();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  void onClose() {}

  Future<void> initializeAudioPlayer() async {
    //  var duration = await player.setUrl(
    //    "https://up.fakaza.com/files/2022/03/Mellow_Sleazy_Sir_Trill_-_Your_Body_ft_DJ_Maphorisa.mp3");
    // var duration = await player.setFilePath('/path/to/file.mp3');

    //var duration = await player.setAsset('assets/audio/9convert.com - Episode 335 I City of Tswane Protests Uber EatsFemale DJsEFF The Braai Show Major  League DJz_320kbps.mp3',preload: true,);

    //loggerNoStack.i("Audio Duration $duration");

    //playlist
    await player.setAudioSource(
      ConcatenatingAudioSource(
        // Start loading next item just before reaching it.
        useLazyPreparation: true, // default

        // Customise the shuffle algorithm.
        shuffleOrder: DefaultShuffleOrder(), // default
        // Specify the items in the playlist.
        children: [
          AudioSource.uri(Uri.parse(
              "https://up.fakaza.com/files/2022/03/MDU_aka_TRP_-_Dangerous_ft_Mthunzi_MJ_Semi_Tee.mp3")),
          AudioSource.uri(Uri.parse(
              "https://up.fakaza.com/files/2022/03/DBN_Gogo_TNK_Musiq_DJ_Stopper_-_Bells_ft_Eltonk_SA.mp3")),
          AudioSource.uri(Uri.parse(
              "https://up.fakaza.com/files/2022/03/DJ_Clen_-_Nkosi_Sikelela_ft_Blaklez_N_veigh_T-Rhyt.mp3")),
          AudioSource.uri(Uri.parse(
              "https://up.fakaza.com/files/2022/03/Tyler_ICU_-_Buya_ft_Riky_Rick_SON_Mas_Musiq_Kelvin_Momo_Zadok.mp3")),
          AudioSource.uri(Uri.parse(
              "https://up.fakaza.com/files/2022/03/JFS_Music_-_Dry_Wave_ft_King_Tone_Soa_Mattrix.mp3")),
          AudioSource.uri(Uri.parse(
              "https://up.fakaza.com/files/2022/03/MDU_aka_TRP_-_Dangerous_ft_Mthunzi_MJ_Semi_Tee.mp3")),
        ],
      ),
      // Playback will be prepared to start from track1.mp3
      //   initialIndex: 0, // default
      // Playback will be prepared to start from position zero.
      //  initialPosition: Duration.zero, // default
    );

    //var duration2 = await player.load();
    // loggerNoStack.i("Audio Duration $duration");
  }

  pauseAudio() async {
    await player.pause();
    isPlayingAudio(false);
  }

  playAudio() async {
    try {
      player.play();
      isPlayingAudio(true);
    } on PlayerException catch (e) {
      // iOS/macOS: maps to NSError.code
      // Android: maps to ExoPlayerException.type
      // Web: maps to MediaError.code
      // Linux/Windows: maps to PlayerErrorCode.index
      loggerNoStack.i("Error code: ${e.code}");
      // iOS/macOS: maps to NSError.localizedDescription
      // Android: maps to ExoPlaybackException.getMessage()
      // Web/Linux: a generic message
      // Windows: MediaPlayerError.message
      loggerNoStack.i("Error message: ${e.message}");
      isPlayingAudio(false);
      await player.pause();
    } on PlayerInterruptedException catch (e) {
      // This call was interrupted since another audio source was loaded or the
      // player was stopped or disposed before this audio source could complete
      // loading.
      loggerNoStack.i("Connection aborted: ${e.message}");
      isPlayingAudio(false);
      await player.pause();
    } catch (e) {
      // Fallback for all errors
      loggerNoStack.i(e);
      isPlayingAudio(false);
      await player.pause();
    }
  }

  //listen to the state of the player
  void _registerPlayerStateStreamListener() {
    player.playerStateStream.listen((state) {
      // loggerNoStack.i("Stream state playing ${state.playing}");
      switch (state.processingState) {
        case ProcessingState.idle:
          //  loggerNoStack.i("idle");
          break;
        case ProcessingState.loading:
          audioIsLoadingOrBuffering(true);
          // loggerNoStack.i("loading");
          break;
        case ProcessingState.buffering:
          audioIsLoadingOrBuffering(true);
          //  loggerNoStack.i("buffering");
          break;
        case ProcessingState.ready:
          audioIsLoadingOrBuffering(false);
          //  loggerNoStack.i("ready");
          break;
        case ProcessingState.completed:
          processAutoPlayCompleted();
        //  loggerNoStack.i("completed");
      }
    });
  }

  //sends back the length of the audio file
  void _registerPlayerDurationListener() {
    player.durationStream.listen((duration) {
      //  loggerNoStack.i("Audio file duration $duration");
      audioDuration(duration);
      //  formatedAudioDuration(_printDuration(duration!));
    });
  }

  //stream counter
  void _registerPlayerPositionStream() {
    player.positionStream.listen((positionStream) {
      //  loggerNoStack.i("Audio file Position stream $positionStream");
      audioStreamPostion(positionStream);
      //  formatedAudioStreamPosition(_printDuration(positionStream));
    });
  }

  void _registerPlayerBufferedPositionStream() {
    player.bufferedPositionStream.listen((bufferedPostion) {
      //  loggerNoStack.i("buffered postion $bufferedPostion");
      audioBufferdPostion(bufferedPostion);
    });
  }

  void _registerIcyMetadataStream() {
    player.icyMetadataStream.listen((icyMetadataStream) {
      //   loggerNoStack.i("icyMetadataStream $icyMetadataStream");
    });
  }

  void _registerPlayingStream() {
    player.playingStream.listen((playingStream) {
      // loggerNoStack.i("playingStream $playingStream");
    });
  }

  void _processingStateStream() {
    player.processingStateStream.listen((processingStateStream) {
      // loggerNoStack.i("processingStateStream $processingStateStream");
    });
  }

  void _registerVolumeStream() {
    player.volumeStream.listen((volumeStream) {
      //  loggerNoStack.i("processing Volume Stream $volumeStream");
    });
  }

  void _registerPlaybackEventStream() {
    player.playbackEventStream.listen((playbackEventStream) {
      // loggerNoStack.i("processing playbackEventStream $playbackEventStream");
    });
  }

  Future<void> seek(Duration seekDuration) async {
    await player.seek(seekDuration);
    loggerNoStack.i("Seeking $seekDuration");
  }

  Future<void> next() async {
    int? nextIndex = player.nextIndex;
    if (nextIndex != null) {
      //skip
      await player.seekToNext();
    } else {
      loggerNoStack.i("load more from database next index is: $nextIndex");
    }
  }

  Future<void> previous() async {
    int? previousIndex = player.previousIndex;
    if (previousIndex != null) {
      //skip
      await player.seekToPrevious();
    } else {
      loggerNoStack
          .i("load more from database previous index is: $previousIndex");
    }
  }

  void processAutoPlayCompleted() {
    if (!suffleEnabled.value && !repeat.value) {
      loggerNoStack.i("Stopping play");
      player.stop();
      audioBufferdPostion(const Duration());
      audioStreamPostion(const Duration());
      isPlayingAudio(false);

      //load more data
      initializeAudioPlayer();
    }
  }

  //TODO other listeners
  // - bufferedPositionStream
// - sequenceStateStream
// - sequenceStream
// - currentIndexStream
// - icyMetadataStream
// - playingStream
// - processingStateStream
// - loopModeStream
// - shuffleModeEnabledStream
// - volumeStream
// - speedStream
// - playbackEventStream

  //format duration to readable string
  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0").replaceAll("-", "");
    String twoDigitMinutes =
        twoDigits(duration.inMinutes.remainder(60)).replaceAll("-", "");
    String twoDigitSeconds =
        twoDigits(duration.inSeconds.remainder(60)).replaceAll("-", "");
    if (twoDigits(duration.inHours) != "00") {
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    } else if (twoDigits(duration.inMinutes.remainder(60)) != "00" ||
        twoDigits(duration.inSeconds.remainder(60)) != "00") {
      return "$twoDigitMinutes:$twoDigitSeconds";
    } else {
      return "00:00";
    }
  }
}
