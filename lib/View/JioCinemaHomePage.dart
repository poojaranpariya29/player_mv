import 'package:flutter/material.dart';
import 'package:player_mv/Controllers/VideoPlayer_Provider.dart';
import 'package:player_mv/Utills/all_Atributes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

class JioCinemaHomePage extends StatefulWidget {
  const JioCinemaHomePage({Key? key}) : super(key: key);

  @override
  State<JioCinemaHomePage> createState() => _JioCinemaHomePageState();
}

class _JioCinemaHomePageState extends State<JioCinemaHomePage> {
  CarouselController carouselController = CarouselController();
  int i = 0;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;

    return Container(
      child: SingleChildScrollView(
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
                    flex: 6,
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
                  Expanded(
                    child: Icon(
                      Icons.search,
                      size: h * 0.033,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Stack(
                children: [
                  CarouselSlider(
                    carouselController: carouselController,
                    options: CarouselOptions(
                        height: h * 0.28,
                        viewportFraction: 1,
                        enlargeCenterPage: true,
                        onPageChanged: (val, _) {
                          setState(() {
                            i = val;
                          });
                        }),
                    items: MyImage.map(
                      (e) => Container(
                        height: h * 0.28,
                        width: w,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                            image: AssetImage(e),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ).toList(),
                  ),
                  Positioned(
                    top: h * 0.16,
                    child: Container(
                      height: h * 0.15,
                      width: w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.black54,
                              Colors.black38,
                              Colors.black26,
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [0.5, 0.7, 0.9, 1]),
                      ),
                    ),
                  ),
                  Positioned(
                    top: h * 0.15,
                    left: w * 0.05,
                    child: (MyImage.indexOf(imagePath + "vikram.png") == i ||
                            MyImage.indexOf(imagePath + "RJ_KK.png") == i ||
                            MyImage.indexOf(imagePath + "jaisval.png") == i)
                        ? (MyImage.indexOf(imagePath + "vikram.png") == i)
                            ? Text(
                                "Vikram Vedha",
                                style: GoogleFonts.kanit(
                                  textStyle: TextStyle(
                                    fontSize: h * 0.03,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : (MyImage.indexOf(imagePath + "RJ_KK.png") == i)
                                ? Text(
                                    "RJ vs KKR Highlights",
                                    style: GoogleFonts.kanit(
                                      textStyle: TextStyle(
                                        fontSize: h * 0.03,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : Text(
                                    "Jaiswal's 98 vs KKR",
                                    style: GoogleFonts.kanit(
                                      textStyle: TextStyle(
                                        fontSize: h * 0.03,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                        : Text(
                            "GT vs MI",
                            style: GoogleFonts.kanit(
                              textStyle: TextStyle(
                                fontSize: h * 0.03,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  ),
                  Positioned(
                    top: h * 0.195,
                    left: w * 0.05,
                    child: Container(
                      height: h * 0.04,
                      width: w * 0.22,
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                          ),
                          Text(
                            "Watch",
                            style: TextStyle(
                              fontSize: h * 0.018,
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: h * 0.181,
                    left: w * 0.32,
                    child: Container(
                      height: h * 0.07,
                      width: w * 0.07,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2.5)),
                      child: Align(
                        child: Icon(
                          Icons.add_rounded,
                          color: Colors.white,
                          size: h * 0.025,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: MyImage.map((e) {
                return InkWell(
                  onTap: () {
                    i = MyImage.indexOf(e);
                    carouselController.animateToPage(i);
                    setState(() {});
                  },
                  child: (MyImage.indexOf(e) == i)
                      ? Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Container(
                            height: h * 0.008,
                            width: w * 0.07,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: h * 0.02,
                            width: w * 0.02,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "TOP TRENDING THIS WEEK",
                          style: GoogleFonts.kanit(
                            textStyle: TextStyle(
                              fontSize: h * 0.023,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: Highlights.map(
                          (e) => GestureDetector(
                            onTap: () {
                              //path = Highlights[i]['path'];
                              Provider.of<VideoPlayer_Provider>(context,
                                      listen: false)
                                  .AddVideo(e['video']);
                              Navigator.of(context)
                                  .pushNamed("VideoPlayPage", arguments: e);
                            },
                            child: Container(
                              height: h * 0.12,
                              width: w * 0.43,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: AssetImage(e['path']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ).toList(),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    Image.asset(imagePath + "ads3.jpg"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
