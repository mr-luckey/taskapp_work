import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_color.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_fontstyle.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_icons.dart';

import 'dailoz_login.dart';
import 'dailoz_signup.dart';

class DailozWelcome extends StatefulWidget {
  const DailozWelcome({Key? key}) : super(key: key);

  @override
  State<DailozWelcome> createState() => _DailozWelcomeState();
}

class _DailozWelcomeState extends State<DailozWelcome> {
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
            ],
          ),
        ),
      ),
    );
  }
}
