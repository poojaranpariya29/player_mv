import 'package:flutter/material.dart';
import 'package:player_mv/Controllers/Audio_Provider.dart';
import 'package:player_mv/Controllers/BottomNavigation_provider.dart';
import 'package:player_mv/Controllers/VideoPlayer_Provider.dart';

import 'package:provider/provider.dart';

import 'View/HomePage.dart';
import 'View/OpenMusicPage.dart';
import 'View/SplachScreen.dart';
import 'View/VideoPlayPage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VideoPlayer_Provider()),
        ChangeNotifierProvider(
            create: (context) => BottomNavigation_provider()),
        ChangeNotifierProvider(create: (context) => Audio_Provider()),
      ],
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => SplachScreen(),
          "HomePage": (context) => HomePage(),
          "VideoPlayPage": (context) => VideoPlayPage(),
          "OpenMusicPage": (context) => OpenMusicPage(),
        },
      ),
    ),
  );
}
