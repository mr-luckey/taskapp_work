import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:taskapp_work/Controllers/addtaskController.dart';
import 'package:taskapp_work/classes/datetimepicker.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_color.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_fontstyle.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_icons.dart';
import '../../dailoz_theme/dailoz_themecontroller.dart';

class DailozAddTask extends StatefulWidget {
  const DailozAddTask({Key? key}) : super(key: key);

  @override
  State<DailozAddTask> createState() => _DailozAddTaskState();
}

class _DailozAddTaskState extends State<DailozAddTask> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  int isselected = 0;
  int selecttime = 0;
  DateTime? _selectedDay;
  String? selectdate;
  final themedata = Get.put(DailozThemecontroler());
  List type = ["Personal", "Private", "Secret"];

  List tag = ["Office", "Home", "Urgent", "Work"];

  List color = [
    DailozColor.bgpurple,
    DailozColor.bgred,
    const Color(0xffFFE9ED),
    DailozColor.bgsky,
  ];

  List textcolor = [
    DailozColor.purple,
    DailozColor.lightred,
    DailozColor.lightred,
    DailozColor.textblue,
  ];
  final DateTimeController dateTimeController = Get.put(DateTimeController());
  final DateTimePickerService dateTimePickerService = DateTimePickerService();
  final CheckBoxController checkBoxController = Get.put(CheckBoxController());

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController startdatetime = TextEditingController();
  final TagController tagController = Get.put(TagController());

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
          "Add_Task".tr,
          style: hsSemiBold.copyWith(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tittle".tr,
                style: hsSemiBold.copyWith(
                    fontSize: 14, color: DailozColor.textgray),
              ),
              TextField(
                style: hsMedium.copyWith(
                    fontSize: 16,
                    color: themedata.isdark
                        ? DailozColor.white
                        : DailozColor.black),
                decoration: InputDecoration(
                    hintStyle: hsMedium.copyWith(
                        fontSize: 16, color: DailozColor.textgray),
                    hintText: "Task Name",
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: DailozColor.greyy))),
              ),
              SizedBox(
                height: height / 36,
              ),
              Text(
                "Date".tr,
                style: hsSemiBold.copyWith(
                    fontSize: 14, color: DailozColor.textgray),
              ),
              Obx(
                () => TextField(
                  // enabled: false,
                  controller: TextEditingController(
                      text: dateTimeController.selectedDate.value),
                  style: hsMedium.copyWith(
                      fontSize: 16,
                      color: themedata.isdark
                          ? DailozColor.white
                          : DailozColor.black),
                  decoration: InputDecoration(
                      hintStyle: hsMedium.copyWith(
                          fontSize: 16, color: DailozColor.textgray),
                      hintText: "dd-mm-yyyy",
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: InkWell(
                            splashColor: DailozColor.transparent,
                            highlightColor: DailozColor.transparent,
                            onTap: () async {
                              await dateTimePickerService.editTime(
                                  context, dateTimeController);
                              // calendar();
                            },
                            child: Image.asset(DailozPngimage.calendar,
                                height: height / 36,
                                color: DailozColor.textgray)),
                      ),
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: DailozColor.greyy))),
                ),
              ),
              SizedBox(
                height: height / 36,
              ),
              Text(
                "Time".tr,
                style: hsSemiBold.copyWith(
                    fontSize: 14, color: DailozColor.textgray),
              ),
              Row(
                children: [
                  SizedBox(
                    width: width / 2.2,
                    child: Obx(() => TextField(
                          controller: TextEditingController(
                              text: dateTimeController.selectedTime.value),
                          readOnly: true,
                          enabled: false,
                          style: hsMedium.copyWith(
                              fontSize: 16,
                              color: themedata.isdark
                                  ? DailozColor.white
                                  : DailozColor.black),
                          decoration: InputDecoration(
                              hintStyle: hsMedium.copyWith(
                                  fontSize: 16, color: DailozColor.textgray),
                              hintText: "HH:MM ",
                              border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: DailozColor.greyy))),
                        )),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: width / 2.2,
                    child:
                        // TimeInputField(),
                        TextField(
                      style: hsMedium.copyWith(
                          fontSize: 16,
                          color: themedata.isdark
                              ? DailozColor.white
                              : DailozColor.black),
                      decoration: InputDecoration(
                          hintStyle: hsMedium.copyWith(
                              fontSize: 16, color: DailozColor.textgray),
                          hintText: "HH:MM",
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: DailozColor.greyy))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 36,
              ),
              Text(
                "Description".tr,
                style: hsSemiBold.copyWith(
                    fontSize: 14, color: DailozColor.textgray),
              ),
              TextField(
                controller: description,
                style: hsMedium.copyWith(
                    fontSize: 16,
                    color: themedata.isdark
                        ? DailozColor.white
                        : DailozColor.black),
                decoration: InputDecoration(
                    hintStyle: hsMedium.copyWith(
                        fontSize: 16, color: DailozColor.textgray),
                    hintText: "Creating this month's work plan",
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: DailozColor.greyy))),
              ),
              SizedBox(
                height: height / 36,
              ),
              Text(
                "Type".tr,
                style: hsSemiBold.copyWith(
                    fontSize: 14, color: DailozColor.textgray),
              ),
              SizedBox(
                height: height / 36,
              ),
              SizedBox(
                  height: height / 26,
                  child: ListView.builder(
                    itemCount: 3, // Three checkboxes
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: width / 20),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            checkBoxController.updateCheckBox(index);
                            // Save the checked value to the database here
                          },
                          child: Obx(() => Row(
                                children: [
                                  Icon(
                                    checkBoxController.selectedCheckBox.value ==
                                            index
                                        ? Icons.check_box_sharp
                                        : Icons.check_box_outline_blank,
                                    size: 22,
                                    color: checkBoxController
                                                .selectedCheckBox.value ==
                                            index
                                        ? Colors.blue
                                        : Colors.grey,
                                  ),
                                  SizedBox(
                                    width: width / 36,
                                  ),
                                  Text(
                                    '${type[index]}',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      );
                    },
                  )),
              SizedBox(
                height: height / 36,
              ),
              Text(
                "Tags".tr,
                style: hsSemiBold.copyWith(
                    fontSize: 14, color: DailozColor.textgray),
              ),
              SizedBox(
                height: height / 36,
              ),
              SizedBox(
                  height: height / 21,
                  child: ListView.builder(
                    itemCount: tag.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          tagController.updateTag(tag[index]);
                        },
                        child: Obx(() => Container(
                              margin: EdgeInsets.only(right: width / 36),
                              height: height / 22,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: tagController.selectedTag.value ==
                                        tag[index]
                                    ? Colors.blue // Highlight selected tag
                                    : color[index],
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width / 20),
                                  child: Text(
                                    tag[index],
                                    style: hsRegular.copyWith(
                                      fontSize: 14,
                                      color: tagController.selectedTag.value ==
                                              tag[index]
                                          ? Colors
                                              .white // Change text color for selected tag
                                          : textcolor[index],
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      );
                    },
                  )),
              SizedBox(
                height: height / 36,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     InkWell(
              //         splashColor: DailozColor.transparent,
              //         highlightColor: DailozColor.transparent,
              //         onTap: () {
              //           newtag();
              //         },
              //         child: Text(
              //           "+ Add new tag".tr,
              //           style: hsMedium.copyWith(
              //               fontSize: 14, color: DailozColor.textappcolor),
              //         )),
              //   ],
              // ),
              //FIXME: Add Tag Functionality will be applied left.
              SizedBox(
                height: height / 26,
              ),
              InkWell(
                splashColor: DailozColor.transparent,
                highlightColor: DailozColor.transparent,
                /*onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DailozDashboard("0");
                  },));
                },*/
                child: Container(
                  width: width / 1,
                  height: height / 15,
                  decoration: BoxDecoration(
                      color: DailozColor.appcolor,
                      borderRadius: BorderRadius.circular(14)),
                  child: Center(
                      child: Text(
                    "Create".tr,
                    style: hsSemiBold.copyWith(
                        fontSize: 16, color: DailozColor.white),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<bool> calendar() async {
  //   return await showDialog(
  //       builder: (context) => AlertDialog(
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(20)),
  //             actionsAlignment: MainAxisAlignment.center,
  //             actions: [
  //               Column(
  //                 children: [
  //                   TableCalendar(
  //                     firstDay: DateTime.now(),
  //                     focusedDay: DateTime.now(),
  //                     lastDay: DateTime.utc(2050, 3, 14),
  //                     headerVisible: true,
  //                     daysOfWeekVisible: true,
  //                     calendarStyle: const CalendarStyle(
  //                       todayDecoration: BoxDecoration(
  //                         color: DailozColor.appcolor,
  //                         shape: BoxShape.circle,
  //                       ),
  //                       todayTextStyle: TextStyle(
  //                         color: DailozColor.white,
  //                       ),
  //                       selectedDecoration: BoxDecoration(
  //                         color: DailozColor.appcolor,
  //                         shape: BoxShape.circle,
  //                       ),
  //                       selectedTextStyle: TextStyle(
  //                         color: DailozColor.white,
  //                       ),
  //                     ),
  //                     shouldFillViewport: false,
  //                     currentDay: _selectedDay,
  //                     calendarFormat: CalendarFormat.month,
  //                     pageAnimationEnabled: false,
  //                     headerStyle: HeaderStyle(
  //                         leftChevronIcon: SizedBox(
  //                           height: height / 26,
  //                           width: height / 26,
  //                           child: const Icon(
  //                             Icons.chevron_left,
  //                             color: DailozColor.textgray,
  //                           ),
  //                         ),
  //                         rightChevronIcon: SizedBox(
  //                             height: height / 26,
  //                             width: height / 26,
  //                             child: const Icon(
  //                               Icons.chevron_right,
  //                               color: DailozColor.textgray,
  //                             )),
  //                         formatButtonVisible: false,
  //                         decoration: const BoxDecoration(
  //                           color: DailozColor.transparent,
  //                         ),
  //                         titleCentered: true,
  //                         titleTextStyle: hsBold.copyWith(
  //                           fontSize: 16,
  //                           color: DailozColor.black,
  //                         )),
  //                     selectedDayPredicate: (day) {
  //                       return isSameDay(_selectedDay, day);
  //                     },
  //                     onDaySelected: (selectedDay, focusedDay) {
  //                       setState(() {
  //                         _selectedDay = selectedDay;
  //                         /*  String convertdate = FormatedDate(_selectedDay.toString());
  //                     selectdate = convertdate;*/
  //                         // Navigator.pop(context);
  //                       });
  //                     },
  //                   ),
  //                   SizedBox(
  //                     height: height / 36,
  //                   ),
  //                   Center(
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         InkWell(
  //                           splashColor: DailozColor.transparent,
  //                           highlightColor: DailozColor.transparent,
  //                           onTap: () {
  //                             Navigator.pop(context);
  //                           },
  //                           child: Container(
  //                             height: height / 20,
  //                             width: width / 4,
  //                             decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(6),
  //                                 border:
  //                                     Border.all(color: DailozColor.appcolor)),
  //                             child: Center(
  //                                 child: Text(
  //                               "Cancel".tr,
  //                               style: hsRegular.copyWith(
  //                                   fontSize: 14, color: DailozColor.appcolor),
  //                             )),
  //                           ),
  //                         ),
  //                         SizedBox(
  //                           width: width / 36,
  //                         ),
  //                         Container(
  //                           height: height / 20,
  //                           width: width / 4,
  //                           decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(6),
  //                               color: DailozColor.appcolor),
  //                           child: Center(
  //                               child: Text(
  //                             "Save".tr,
  //                             style: hsRegular.copyWith(
  //                                 fontSize: 14, color: DailozColor.white),
  //                           )),
  //                         )
  //                       ],
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: height / 56,
  //                   ),
  //                 ],
  //               )
  //             ],
  //           ),
  //       context: context);
  // }

  Future<bool> newtag() async {
    return await showDialog(
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 56, vertical: height / 96),
                  child: Column(
                    children: [
                      Text("New_Tag".tr,
                          style: hsSemiBold.copyWith(fontSize: 22)),
                      SizedBox(
                        height: height / 36,
                      ),
                      SizedBox(
                        height: height / 14,
                        child: TextFormField(
                            cursorColor: DailozColor.black,
                            style: hsMedium.copyWith(
                                fontSize: 16, color: DailozColor.black),
                            decoration: InputDecoration(
                              hintText: 'Add tag'.tr,
                              filled: true,
                              fillColor: DailozColor.bggray,
                              hintStyle: hsMedium.copyWith(
                                  fontSize: 16, color: DailozColor.textgray),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none),
                            )),
                      ),
                      SizedBox(
                        height: height / 36,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: DailozColor.transparent,
                              highlightColor: DailozColor.transparent,
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: height / 20,
                                width: width / 4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        color: DailozColor.appcolor)),
                                child: Center(
                                    child: Text(
                                  "Cancel".tr,
                                  style: hsRegular.copyWith(
                                      fontSize: 14,
                                      color: DailozColor.appcolor),
                                )),
                              ),
                            ),
                            SizedBox(
                              width: width / 36,
                            ),
                            Container(
                              height: height / 20,
                              width: width / 4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: DailozColor.appcolor),
                              child: Center(
                                  child: Text(
                                "Save".tr,
                                style: hsRegular.copyWith(
                                    fontSize: 14, color: DailozColor.white),
                              )),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height / 56,
                      ),
                    ],
                  ),
                )
              ],
            ),
        context: context);
  }
}
