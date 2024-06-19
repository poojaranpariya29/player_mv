import 'dart:async';

import 'package:flutter/material.dart';
import 'package:player_mv/Controllers/VideoPlayer_Provider.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:provider/provider.dart';

import '../../Utills/all_Atributes.dart';

class VideoPlayPage extends StatefulWidget {
  const VideoPlayPage({Key? key}) : super(key: key);

  @override
  State<VideoPlayPage> createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> {
  @override
  void dispose() {
    super.dispose();
    Provider.of<VideoPlayer_Provider>(context, listen: false).StopVideo();
  }

  @override
  void deactivate() {
    super.deactivate();
    Provider.of<VideoPlayer_Provider>(context, listen: false).StopVideo();
  }

  @override
  Widget build(BuildContext context) {
    Map date = ModalRoute.of(context)!.settings.arguments as Map;

    Timer(Duration(seconds: 5), () {
      CircularProgressIndicator();
    });

    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Container(
                      height: h * 0.28,
                      width: w,
                      child: Chewie(
                          controller: Provider.of<VideoPlayer_Provider>(context,
                                  listen: true)
                              .v1
                              .chewieController!),
                    ),
                  ),
                  Positioned(
                    top: h * 0.05,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.white,
                        size: h * 0.04,
                      ),
                    ),
                  )
                ],
              ),
              ListTile(
                title: Text(
                  "${date['name']}",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            Text(
                              "Watchlist",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: h * 0.013,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: h * 0.04,
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                            Text(
                              "Share",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: h * 0.013,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image.asset(imagePath + "ads3.jpg"),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Image.asset(imagePath + "more.png"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xff000000),
    );
  }
}
