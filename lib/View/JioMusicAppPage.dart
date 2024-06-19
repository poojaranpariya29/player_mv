import 'package:flutter/material.dart';

import '../../Utills/all_Atributes.dart';
import 'package:google_fonts/google_fonts.dart';

class JioMusicAppPage extends StatefulWidget {
  const JioMusicAppPage({Key? key}) : super(key: key);

  @override
  State<JioMusicAppPage> createState() => _JioMusicAppPageState();
}

class _JioMusicAppPageState extends State<JioMusicAppPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              height: h * 0.065,
              width: w,
              color: Color(0xff000022),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(imagePath + "jioCinemaLogo.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w * 0.02,
                  ),
                  Expanded(
                    flex: 7,
                    child: Text(
                      "JioCinema",
                      style: GoogleFonts.secularOne(
                        textStyle: TextStyle(
                          fontSize: h * 0.025,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DefaultTabController(
              length: 2,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: TabBar(
                        indicatorColor: Colors.greenAccent,
                        indicatorWeight: 5,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                        tabs: allTabs
                            .map(
                              (e) => Tab(
                                text: e['title'],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Container(
                      height: h * 0.75,
                      child: TabBarView(
                        children: allTabs
                            .map<Widget>((e) => e['Page'] as Widget)
                            .toList(),
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
}
