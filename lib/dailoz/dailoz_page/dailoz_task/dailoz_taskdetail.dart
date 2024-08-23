import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_color.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_fontstyle.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_icons.dart';
import '../../dailoz_theme/dailoz_themecontroller.dart';
import 'package:hive/hive.dart';

class DailozTaskdetail extends StatefulWidget {
  final String taskType;
  final String endDate;
  final String startTime;
  final String endTime;
  final String taskDescription;
  final String title;
  final List<String> tags;

  const DailozTaskdetail({
    Key? key,
    required this.taskType,
    required this.title,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.taskDescription,
    required this.tags,
  }) : super(key: key);

  @override
  State<DailozTaskdetail> createState() => _DailozTaskdetailState();
}

class _DailozTaskdetailState extends State<DailozTaskdetail> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DailozThemecontroler());

  List<Color> color = [
    DailozColor.bgpurple,
    DailozColor.bgred,
    const Color(0xffFFE9ED),
    DailozColor.bgsky,
  ];

  List<Color> textcolor = [
    DailozColor.purple,
    DailozColor.lightred,
    DailozColor.lightred,
    DailozColor.textblue,
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            splashColor: DailozColor.transparent,
            highlightColor: DailozColor.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: height / 20,
              width: height / 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: DailozColor.white,
                  boxShadow: const [
                    BoxShadow(color: DailozColor.textgray, blurRadius: 5)
                  ]),
              child: Padding(
                padding: EdgeInsets.only(left: width / 56),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: DailozColor.black,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          "Detail".tr,
          style: hsSemiBold.copyWith(fontSize: 18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              splashColor: DailozColor.transparent,
              highlightColor: DailozColor.transparent,
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: height / 20,
                width: height / 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: DailozColor.white,
                    boxShadow: const [
                      BoxShadow(color: DailozColor.textgray, blurRadius: 5)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Image.asset(
                    DailozPngimage.moreSquare,
                    height: height / 36,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: hsSemiBold.copyWith(fontSize: 24),
              ),
              Text(
                widget.taskType,
                style: hsRegular.copyWith(fontSize: 14),
              ),
              SizedBox(
                height: height / 36,
              ),
              Row(
                children: [
                  Container(
                    width: width / 2.2,
                    decoration: BoxDecoration(
                        color: DailozColor.lightred,
                        borderRadius: BorderRadius.circular(14)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width / 36, vertical: height / 56),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "End Date".tr,
                            style: hsMedium.copyWith(
                                fontSize: 18, color: const Color(0x80FFFFFF)),
                          ),
                          Text(
                            widget.endDate,
                            style: hsMedium.copyWith(
                                fontSize: 18, color: DailozColor.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: width / 2.2,
                    decoration: BoxDecoration(
                        color: DailozColor.lightred,
                        borderRadius: BorderRadius.circular(14)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width / 36, vertical: height / 56),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Time".tr,
                            style: hsMedium.copyWith(
                                fontSize: 18, color: const Color(0x80FFFFFF)),
                          ),
                          Text(
                            "${widget.startTime} - ${widget.endTime}",
                            style: hsMedium.copyWith(
                                fontSize: 18, color: DailozColor.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 36,
              ),
              Text(
                "Task Description".tr,
                style: hsSemiBold.copyWith(fontSize: 20),
              ),
              SizedBox(
                height: height / 36,
              ),
              Text(
                widget.taskDescription,
                style: hsRegular.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: height / 36,
              ),
              Text(
                "Tags".tr,
                style: hsSemiBold.copyWith(fontSize: 20),
              ),
              SizedBox(
                height: height / 46,
              ),
              SizedBox(
                height: height / 21,
                child: ListView.builder(
                  itemCount: widget.tags.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: width / 36),
                      height: height / 22,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: color[index % color.length]),
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 20),
                        child: Text(
                          widget.tags[index],
                          style: hsRegular.copyWith(
                              fontSize: 14,
                              color: textcolor[index % textcolor.length]),
                        ),
                      )),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
