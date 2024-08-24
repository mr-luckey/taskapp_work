import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_color.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_fontstyle.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_icons.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String startTime;
  final String endTime;
  final List<String> tags;

  TaskCard(
      {required this.title,
      required this.startTime,
      required this.endTime,
      required this.tags});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 46),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: DailozColor.bggray,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 36,
            vertical: MediaQuery.of(context).size.height / 66),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style:
                      hsMedium.copyWith(fontSize: 16, color: DailozColor.black),
                ),
                Spacer(),
                Image.asset(DailozPngimage.dot,
                    height: MediaQuery.of(context).size.height / 36),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 200),
            Text(
              "${DateFormat("hh:mm a".toString()).parseStrict(startTime)} - ${DateFormat("hh:mm a".toString()).parseStrict(endTime)}}",
              style:
                  hsRegular.copyWith(fontSize: 14, color: DailozColor.textgray),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 66),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: tags.map((tag) {
                  return Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 36),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0x338F99EB),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 36,
                            vertical: MediaQuery.of(context).size.height / 120),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            tag,
                            style: hsMedium.copyWith(
                                fontSize: 10, color: DailozColor.appcolor),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
