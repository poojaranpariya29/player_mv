import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Controllers/Audio_Provider.dart';
import '../../Utills/all_Atributes.dart';

class MusicHomePage extends StatefulWidget {
  const MusicHomePage({Key? key}) : super(key: key);

  @override
  State<MusicHomePage> createState() => _MusicHomePageState();
}

class _MusicHomePageState extends State<MusicHomePage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: h * 0.02,
          ),
          ListTile(
            title: Text(
              "Hello Jaynesh Sarkar !",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: h * 0.02,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
            ),
            subtitle: Text(
              "Lets listen something cool Today",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: h * 0.015,
                  color: Colors.grey.shade700,
                  letterSpacing: 1,
                ),
              ),
            ),
            trailing: Container(
              height: h * 0.1,
              width: w * 0.1,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.notification_add_outlined,
                color: Colors.grey,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Your Favourite artist",
              style: TextStyle(
                color: Colors.white,
                fontSize: h * 0.025,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Icon(
              Icons.navigate_next_outlined,
              color: Colors.white,
            ),
          ),
          Container(
            height: h * 0.15,
            child: ListView.builder(
              itemCount: SingerImage.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) => GestureDetector(
                onTap: () {
                  Provider.of<Audio_Provider>(context, listen: false)
                      .getIndex(i);
                  Provider.of<Audio_Provider>(context, listen: false)
                      .initAudio(); //
                  Navigator.of(context)
                      .pushNamed("OpenMusicPage", arguments: i);
                },
                child: SingerCircle(SingerImage[i], SingerName[i]),
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Recent played",
              style: TextStyle(
                color: Colors.white,
                fontSize: h * 0.025,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Icon(
              Icons.navigate_next_outlined,
              color: Colors.white,
            ),
          ),
          Container(
            height: h * 0.2,
            child: ListView.builder(
              itemCount: RecentImage.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) => GestureDetector(
                onTap: () {},
                child: Recent(RecentImage[i], RecentName[i]),
              ),
            ),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          Image.asset(imagePath + "Post1.jpg"),
          SizedBox(
            height: h * 0.01,
          ),
          Image.asset(imagePath + "Post2.jpg"),
        ],
      ),
    );
  }

  Widget SingerCircle(String Img, String Name) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: h * 0.1,
          width: w * 0.25,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              Img,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(Name,
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: h * 0.012, letterSpacing: 1)),
      ],
    );
  }

  Widget Recent(String Img, String Name) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: h * 0.14,
          width: w * 0.29,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage(Img), fit: BoxFit.cover),
          ),
        ),
        Text(Name,
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: h * 0.012, letterSpacing: 1)),
      ],
    );
  }
}
