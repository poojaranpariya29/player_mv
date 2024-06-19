import 'package:flutter/material.dart';
import 'package:player_mv/Utills/all_Atributes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Controllers/Audio_Provider.dart';

class OpenMusicPage extends StatefulWidget {
  const OpenMusicPage({Key? key}) : super(key: key);

  @override
  State<OpenMusicPage> createState() => _OpenMusicPageState();
}

class _OpenMusicPageState extends State<OpenMusicPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: h,
              width: w,
              child: Image.asset(
                SingerImage[Provider.of<Audio_Provider>(context).a1.index],
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: h,
              width: w,
              color: Colors.black12,
            ),
            Container(
              height: h * 0.05,
              width: w,
              child: Row(
                children: [
                  SizedBox(
                    height: h * 0.015,
                  ),
                  IconButton(
                    onPressed: () {
                      Provider.of<Audio_Provider>(context, listen: false).onIconChange();
                      Navigator.of(context).pop();
                    },

                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: h * 0.04,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      size: h * 0.03,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  SizedBox(
                    width: h * 0.01,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      size: h * 0.03,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: h * 0.35,
                width: w,
                color: Colors.black38,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${SongName[Provider.of<Audio_Provider>(context).a1.index]} - ${SingerName[Provider.of<Audio_Provider>(context).a1.index]}",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: h * 0.018,
                                    color: Colors.white60,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              Text(
                                "${AlbumsName[Provider.of<Audio_Provider>(context).a1.index]}",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: h * 0.011,
                                    color: Colors.white60,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.all_inclusive,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.green,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    // PlayerBuilder.currentPosition(
                    //   player: Provider.of<Audio_Provider>(context)
                    //       .a1
                    //       .assetsAudioPlayer!,
                    //   builder: (context, position) => Column(
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.only(left: 14, right: 14),
                    //         child: Slider(
                    //           max: Provider.of<Audio_Provider>(context)
                    //               .a1
                    //               .totalDuration
                    //               .inSeconds
                    //               .toDouble(),
                    //           value: position.inSeconds.toDouble(),
                    //           onChanged: (val) {
                    //             Provider.of<Audio_Provider>(context, listen: false).a1.assetsAudioPlayer!.seek(Duration(seconds: val.toInt()));
                    //           },
                    //           inactiveColor: Colors.grey,
                    //           activeColor: Colors.green,
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.only(left: 20, right: 20),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text(
                    //               "${position.inHours}:${position.inMinutes}:${position.inSeconds}",
                    //               style: GoogleFonts.poppins(
                    //                 color: Colors.white60,
                    //                 letterSpacing: 1,
                    //                 fontSize: h * 0.015,
                    //               ),
                    //             ),
                    //             Text(
                    //               "${Provider.of<Audio_Provider>(context).a1.totalDuration.inHours}:${Provider.of<Audio_Provider>(context).a1.totalDuration.inMinutes}:${Provider.of<Audio_Provider>(context).a1.totalDuration.inSeconds}",
                    //               style: GoogleFonts.poppins(
                    //                 color: Colors.white60,
                    //                 letterSpacing: 1,
                    //                 fontSize: h * 0.015,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    StreamBuilder(
                        stream: Provider.of<Audio_Provider>(context)
                            .a1
                            .assetsAudioPlayer!
                            .currentPosition,
                        builder: (context, snapShot) {
                          Duration data = snapShot.data ?? Duration(seconds: 0);

                          // try {
                          //   totalDuration = Provider.of<Audio_Provider>(context).a1.assetsAudioPlayer!.current.value?.audio.duration;
                          // } catch (e) {
                          //   totalDuration = Duration(seconds: 0);
                          //   print(e);
                          // }

                          return Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                child: Slider(
                                  min: 0,
                                  max: Provider.of<Audio_Provider>(context).a1.totalDuration.inSeconds.toDouble(),
                                  value: data.inSeconds.toDouble(),
                                  onChanged: (val) {
                                    Provider.of<Audio_Provider>(context, listen: false).a1.assetsAudioPlayer!.seek(Duration(seconds: val.toInt()));
                                  },
                                  inactiveColor: Colors.grey,
                                  activeColor: Colors.green,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${data.toString().split('.')[0]}",
                                      style: GoogleFonts.poppins(
                                        color: Colors.white60,
                                        letterSpacing: 1,
                                        fontSize: h * 0.015,
                                      ),
                                    ),
                                    Text(
                                      "${Provider.of<Audio_Provider>(context).a1.totalDuration.toString().split(".")[0]}",
                                      style: GoogleFonts.poppins(
                                        color: Colors.white60,
                                        letterSpacing: 1,
                                        fontSize: h * 0.015,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.loop,
                              color: Colors.white60,
                              size: h * 0.04,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Provider.of<Audio_Provider>(context, listen: false).subIndex();
                              Provider.of<Audio_Provider>(context, listen: false).stopAudio();
                              Provider.of<Audio_Provider>(context, listen: false).onIconChange();
                              Provider.of<Audio_Provider>(context, listen: false).initAudio();
                              //Provider.of<Audio_Provider>(context, listen: false).previousSong();
                            },
                            icon: Icon(
                              Icons.skip_previous,
                              color: Colors.white,
                              size: h * 0.06,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Provider.of<Audio_Provider>(context, listen: false).onIconChange();
                              Provider.of<Audio_Provider>(context, listen: false).startButton();
                            },
                            icon: (Provider.of<Audio_Provider>(context).a1.iconChange)
                                ? Icon(
                                    Icons.pause_circle,
                                    color: Colors.green,
                                    size: h * 0.07,
                                  )
                                : Icon(
                                    Icons.play_circle,
                                    color: Colors.green,
                                    size: h * 0.07,
                                  ),
                          ),
                          IconButton(
                            onPressed: () {
                              Provider.of<Audio_Provider>(context, listen: false).addIndex();
                              Provider.of<Audio_Provider>(context, listen: false).stopAudio();
                              Provider.of<Audio_Provider>(context, listen: false).onIconChange();
                              Provider.of<Audio_Provider>(context, listen: false).initAudio();
                              print("*********************************************");
                              print(Provider.of<Audio_Provider>(context,listen: false).a1.index);
                              print("*********************************************");
                              // Provider.of<Audio_Provider>(context,listen: false).nextSong();
                            },
                            icon: Icon(
                              Icons.skip_next,
                              color: Colors.white,
                              size: h * 0.06,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Provider.of<Audio_Provider>(context,
                                      listen: false)
                                  .muteUnmute();
                            },
                            icon:
                                (Provider.of<Audio_Provider>(context).a1.onMute)
                                    ? Icon(
                                        Icons.volume_mute_outlined,
                                        color: Colors.white60,
                                        size: h * 0.04,
                                      )
                                    : Icon(
                                        Icons.volume_mute,
                                        color: Colors.white60,
                                        size: h * 0.04,
                                      ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    Provider.of<Audio_Provider>(context, listen: false).stopAudio();
  }
}
