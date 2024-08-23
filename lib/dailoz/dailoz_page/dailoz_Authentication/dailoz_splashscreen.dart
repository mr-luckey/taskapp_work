import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_fontstyle.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_icons.dart';
import 'package:taskapp_work/dailoz/dailoz_page/dailoz_home/dailoz_dashboard.dart';

import '../../dailoz_gloabelclass/dailoz_color.dart';
import 'dailoz_welcome.dart';

class DailozSplashscreen extends StatefulWidget {
  const DailozSplashscreen({Key? key}) : super(key: key);

  @override
  State<DailozSplashscreen> createState() => _DailozSplashscreenState();
}

class _DailozSplashscreenState extends State<DailozSplashscreen> {
  @override
  void initState() {
    super.initState();
    goup();
  }

  goup() async {
    var navigator = Navigator.of(context);
    await Future.delayed(const Duration(seconds: 3));
    navigator.push(MaterialPageRoute(
      builder: (context) {
        return DailozDashboard(0);
      },
    ));
  }

  dynamic size;
  double height = 0.00;
  double width = 0.00;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height / 36, horizontal: width / 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height / 8,
              ),
              Image.asset(
                DailozPngimage.spash,
                height: height / 3,
                fit: BoxFit.fitHeight,
              ),
              SizedBox(
                height: height / 16,
              ),
              Text(
                "ToDo Xpert",
                style: hsBold.copyWith(
                    fontSize: 50,
                    color: DailozColor.appcolor,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
              Text(
                "Manage your task with ToDo Xpert",
                style: hsBold.copyWith(
                    fontSize: 20,
                    color: DailozColor.appcolor,
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
              SizedBox(
                height: height / 16,
              ),
              CircularProgressIndicator(
                color: DailozColor.appcolor,
              ),
              SizedBox(
                height: height / 46,
              ),
              Text(
                "Loading",
                style: TextStyle(
                    color: DailozColor.appcolor,
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
