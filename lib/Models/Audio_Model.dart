import 'package:assets_audio_player/assets_audio_player.dart';

class Audio_Model {
  AssetsAudioPlayer? assetsAudioPlayer;
  bool iconChange;
  bool onMute;
  Duration totalDuration;
  int index;

  Audio_Model(
      {this.assetsAudioPlayer,
      required this.iconChange,
      required this.onMute,
      required this.totalDuration,
      required this.index});
}
