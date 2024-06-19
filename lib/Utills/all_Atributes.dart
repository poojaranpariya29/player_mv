import 'package:flutter/material.dart';
import 'package:player_mv/View/JioCinemaHomePage.dart';
import 'package:player_mv/View/AlbumsPage.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import '../View/HomePageMusic.dart';
import '../View/JioMusicAppPage.dart';

String imagePath = "assets/images/";
String videoPath = "assets/videos/";

List<String> MyImage = [
  imagePath + "GT_MI.jpg",
  imagePath + "insiders.png",
  imagePath + "hangout.png",
  imagePath + "vikram.png",
  imagePath + "RJ_KK.png",
  imagePath + "jaisval.png",
];

List<Map<String, dynamic>> Highlights = [
  {
    "path": imagePath + "devadeva.png",
    "video": videoPath + "DevaDeva.mp4",
    "name": "Deva Deva",
  },
  {
    "path": imagePath + "kesariya.png",
    "video": videoPath + "kesariya1.mp4",
    "name": "kesariya",
  },
  {
    "path": imagePath + "king.png",
    "video": videoPath + "kgf.mp4",
    "name": "king",
  },
  {
    "path": imagePath + "levels.png",
    "video": videoPath + "levels.mp4",
    "name": "levels",
  },
  {
    "path": imagePath + "rocky.png",
    "video": videoPath + "maan.mp4",
    "name": "rocky",
  },
];

List<Widget> Componets = [
  JioMusicAppPage(),
  JioCinemaHomePage(),
];
List<Map<String, dynamic>> allTabs = [
  {
    "title": "HOME",
    "Page": MusicHomePage(),
  },
  {
    "title": "ALBUMS",
    "Page": AlbumsPage(),
  },
];

String SingerImagePath = "assets/SingersImage/";

List<String> SingerImage = [
  SingerImagePath + "arijit.png",
  SingerImagePath + "a_r.png",
  SingerImagePath + "sonu.png",
  SingerImagePath + "shreya.png",
  SingerImagePath + "lata.png",
  SingerImagePath + "darshan.png",
  SingerImagePath + "neha.png",
  SingerImagePath + "badshah.png",
  SingerImagePath + "dhvani.png",
  SingerImagePath + "tulsi.png",
];
List<String> RecentImage = [
  SingerImagePath + "love.png",
  SingerImagePath + "puspa.png",
  SingerImagePath + "holy.png",
  SingerImagePath + "hony.png",
  SingerImagePath + "desh.png",
];

List<String> RecentName = [
  "Love Song",
  "South Hit",
  "Hollywood",
  "Party Hit",
  "Desh Bhakri",
];

List<String> SingerName = [
  "Arijit Singh",
  "A R Rahman",
  "Sonu Nigam",
  "Shreya ",
  "Lata Mangeshkar",
  "Darshan Raval",
  "Neha Kakkar",
  "Badshah",
  "Dhvani Bhanushali",
  "Tulsi Kumar",
];

String audioPath = "assets/audio/";

List<Audio> MySongList = [
  Audio(audioPath + "arijit.mp3"),
  Audio(audioPath + "ar.mp3"),
  Audio(audioPath + "sonu.mp3"),
  Audio(audioPath + "shreya.mp3"),
  Audio(audioPath + "lata.mp3"),
  Audio(audioPath + "darshan.mp3"),
  Audio(audioPath + "neha.mp3"),
  Audio(audioPath + "badshah.mp3"),
  Audio(audioPath + "dhvani.mp3"),
  Audio(audioPath + "tulsi.mp3"),
];

List<String> SongName = [
  "O Bedardeya",
  "The Humma",
  "Abhi Mujk Me",
  "Saans",
  "Lag Jaa",
  "Chogada",
  "Yaad Piya K",
  "Genda Phool",
  "Leja Re",
  "Shut Up",
];

List<String> AlbumsName = [
  "Tu Jhoothi Main Makkar(2023)",
  "Ok Jaanu(2017)",
  "Agneepath(2012)",
  "Jab Tak Hai Jaan(2012)",
  "Woh Kaun Thi?(1964)",
  "Loveatri(2018)",
  "Yaad Piya Ki Aane Lagi(2019)",
  "Genda Phool(2020)",
  "Leja Ra(2018)",
  "Shut Up(2022)",
];
String LoveAlbumsPath = "assets/LoveImages/";

List<String> LoveAlbumsImage = [
  LoveAlbumsPath + "obe.png",
  LoveAlbumsPath + "humma.png",
  LoveAlbumsPath + "abhi.png",
  LoveAlbumsPath + "saans.png",
  LoveAlbumsPath + "lagJa.png",
  LoveAlbumsPath + "chogada.png",
  LoveAlbumsPath + "piya.png",
  LoveAlbumsPath + "genda.png",
  LoveAlbumsPath + "leja.png",
  LoveAlbumsPath + "shutup.png",
];

Duration totalDuration = Duration(seconds: 0);
