import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controllers/Audio_Provider.dart';
import '../Utills/all_Atributes.dart';
import 'package:provider/provider.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({Key? key}) : super(key: key);

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;

    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h * 0.03,
            ),
            Container(
              height: h * 0.45,
              width: w,
              color: Colors.yellow,
              child: Image.asset(
                imagePath + "LoveSummer.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  SizedBox(
                    width: h * 0.01,
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.grey.shade700,
                    size: 12,
                  ),
                  SizedBox(
                    width: h * 0.01,
                  ),
                  Text(
                    "45,756,226 Likes",
                    style: GoogleFonts.poppins(
                      fontSize: h * 0.01,
                      letterSpacing: 1,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(
                    width: h * 0.01,
                  ),
                  Icon(
                    Icons.timer,
                    color: Colors.grey.shade700,
                    size: h * 0.012,
                  ),
                  SizedBox(
                    width: h * 0.01,
                  ),
                  Text(
                    "2h 46min",
                    style: GoogleFonts.poppins(
                      fontSize: h * 0.01,
                      letterSpacing: 1,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                "Featuring",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white70,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            Container(
              height: h * 1,
              child: ListView.builder(
                itemCount: LoveAlbumsImage.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, i) => GestureDetector(
                    onTap: () {
                      Provider.of<Audio_Provider>(context, listen: false)
                          .getIndex(i);
                      Provider.of<Audio_Provider>(context, listen: false)
                          .initAudio();
                      Navigator.of(context)
                          .pushNamed("OpenMusicPage", arguments: i);
                    },
                    child: PlayList(
                        LoveAlbumsImage[i], SongName[i], SingerName[i])),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget PlayList(String img, String Fname, String Sname) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            height: h * 0.08,
            width: w * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: h * 0.015,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Fname,
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  letterSpacing: 1,
                  fontSize: h * 0.018,
                ),
              ),
              Text(
                Sname,
                style: GoogleFonts.poppins(
                  color: Colors.white60,
                  letterSpacing: 1,
                  fontSize: h * 0.012,
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.favorite_border,
            color: Colors.grey.shade700,
          ),
          SizedBox(
            width: h * 0.01,
          ),
          Icon(
            Icons.more_vert,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
