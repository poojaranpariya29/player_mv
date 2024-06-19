import 'package:flutter/material.dart';
import 'package:player_mv/Models/Audio_Model.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import '../Utills/all_Atributes.dart';

class Audio_Provider extends ChangeNotifier {
  Audio_Model a1 = Audio_Model(
      iconChange: false,
      onMute: true,
      totalDuration: Duration(seconds: 0),
      index: 0);

  onIconChange() {
    a1.iconChange = !a1.iconChange;
    notifyListeners();
  }

  initAudio() {
    a1.assetsAudioPlayer = AssetsAudioPlayer();
    a1.assetsAudioPlayer!.open(
      Playlist(
        audios: MySongList,
        startIndex: a1.index,
      ),
      showNotification: true,
      // playInBackground: PlayInBackground.disabledPause,
      autoStart: false,
    );
     totalDurationAudio();
  }

  Future<void> startButton() async {
    await a1.assetsAudioPlayer!.playOrPause();
    notifyListeners();
  }

  void muteUnmute() {
    a1.assetsAudioPlayer!.setVolume(a1.onMute ? 0 : 1);
    a1.onMute = !a1.onMute;
    notifyListeners();
  }

  Future<void> stopAudio() async {
    await a1.assetsAudioPlayer!.stop();
    notifyListeners();
  }

  void totalDurationAudio() {
    a1.assetsAudioPlayer!.current.listen((event) {
      a1.totalDuration = event!.audio.duration;
      notifyListeners();
    });
  }

  Future<void> nextSong() async {
    await a1.assetsAudioPlayer!.next();
    notifyListeners();
  }

  Future<void> previousSong() async {
    await a1.assetsAudioPlayer!.previous();
    notifyListeners();
  }

  getIndex(int i) {
    a1.index = i;
    notifyListeners();
  }

  addIndex() {
    if (a1.index < 9) {
      a1.index++;
    } else {
      a1.index = 0;
    }
    notifyListeners();
  }

  subIndex() {
    if (a1.index > 0) {
      a1.index--;
    } else {
      a1.index = 9;
    }
    notifyListeners();
  }
}
