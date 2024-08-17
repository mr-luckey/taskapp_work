import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taskapp_work/Controllers/addtaskController.dart';
import 'package:taskapp_work/boxes/boxes.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_color.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_fontstyle.dart';
import 'package:taskapp_work/dailoz/dailoz_page/dailoz_home/dailoz_dashboard.dart';
import 'package:taskapp_work/models/taskModel.dart';
import '../../dailoz_theme/dailoz_themecontroller.dart';

class DailozAddTask extends StatefulWidget {
  DailozAddTask({Key? key, required this.headtitle, required this.check})
      : super(key: key);
  String headtitle;
  int check;
  @override
  State<DailozAddTask> createState() => _DailozAddTaskState();
}

class _DailozAddTaskState extends State<DailozAddTask> {
  dynamic size;
  double height = 0.00;
  final TextEditingController startdatetimeController = TextEditingController();
  final TextEditingController enddatetimeController = TextEditingController();
  // final DatetimeController _dateTimeController = Get.put(DatetimeController());
  double width = 0.00;
  int isselected = 0;
  int selecttime = 0;
  DateTime? _selectedDay;
  String? selectdate;
  final themedata = Get.put(DailozThemecontroler());
  List type = ["Personal", "Private", "Secret"];

  List tag = ["Office", "Home", "Urgent", "Work", "Event", "Meeting"];

  List color = [
    DailozColor.bgpurple,
    DailozColor.bgred,
    const Color(0xffFFE9ED),
    DailozColor.bgsky,
    DailozColor.bgpurple,
    DailozColor.parrot
  ];

  List textcolor = [
    DailozColor.purple,
    DailozColor.lightred,
    DailozColor.lightred,
    DailozColor.textblue,
    DailozColor.purple,
    DailozColor.lightgreen
  ];

  final CheckBoxController checkBoxController = Get.put(CheckBoxController());

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  String selectedstartdate = '';
  String selectededdate = '';
  DateTime? _pickedDate;
  TimeOfDay? _pickedTime;

  final TagController tagController = Get.put(TagController());
  Future<void> _selectstartDate(
    BuildContext context,
  ) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          _pickedDate = pickedDate; // Save picked date to a variable
          _pickedTime = pickedTime; // Save picked time to a variable
          print(pickedTime);
          print(pickedDate.toLocal().toString().split(' ')[0]);
          selectedstartdate = pickedDate.toLocal().toString().split(' ')[0];
          print("checking");
          //TODO: model variable creation and then save start date in it
          // Format the picked time to a readable string
          print(selectedstartdate);
          final String formattedTime = pickedTime.format(context);
          startdatetimeController.text = formattedTime;
        });
      }
    }
  }

  Future<void> _endselectDate(
    BuildContext context,
  ) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final DateTime combinedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          _pickedDate = pickedDate; // Save picked date to a variable
          _pickedTime = pickedTime; // Save picked time to a variable
          print(pickedTime);
          selectededdate = pickedDate.toLocal().toString().split(' ')[0];
//TODO: model enddate creation and set data
          // Format the picked time to a readable string
          final String formattedTime = pickedTime.format(context);
          enddatetimeController.text = formattedTime;
        });
      }
    }
  }

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
          "Add ${widget.headtitle} Task".tr,
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
                controller: title,
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
              ), //TODO: UI comited of date field

              SizedBox(
                height: height / 36,
              ),
              Text(
                "Date & Time",
                style: hsSemiBold.copyWith(
                    fontSize: 14, color: DailozColor.textgray),
              ),
              Row(
                children: [
                  SizedBox(
                      width: width / 2.2,
                      child: InkWell(
                        onTap: () {
                          _selectstartDate(context);
                        },
                        child: TextField(
                          controller: startdatetimeController,
                          // controller: _dateTimeController.startTime,

                          // controller: controllerpicker.,
                          // controller:
                          // TextEditingController(
                          //     text: dateTimeController.selectedTime.value),
                          readOnly: true,
                          enabled: false,
                          // ,
                          // controller: con,
                          style: hsMedium.copyWith(
                              fontSize: 16,
                              color: themedata.isdark
                                  ? DailozColor.white
                                  : DailozColor.black),
                          decoration: InputDecoration(
                              hintStyle: hsMedium.copyWith(
                                  fontSize: 16, color: DailozColor.textgray),
                              hintText: "Start Time ",
                              border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: DailozColor.greyy))),
                        ),
                      )),
                  const Spacer(),
                  SizedBox(
                    width: width / 2.2,
                    child:
                        // TimeInputField(),
                        TextField(
                      onTap: () {
                        _endselectDate(context);
                      },
                      controller: enddatetimeController,
                      style: hsMedium.copyWith(
                          fontSize: 16,
                          color: themedata.isdark
                              ? DailozColor.white
                              : DailozColor.black),
                      decoration: InputDecoration(
                          hintStyle: hsMedium.copyWith(
                              fontSize: 16, color: DailozColor.textgray),
                          hintText: "End Time",
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
              SingleChildScrollView(
                child: SizedBox(
                  height: height / 21,
                  child: ListView.builder(
                    itemCount: tag.length,
                    // itemCount: tag.length,
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
                                color: tagController.selectedTags
                                        .contains(tag[index])
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
                                      color: tagController.selectedTags
                                              .contains(tag[index])
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
                  ),
                ),
              ),

              SizedBox(
                height: height / 36,
              ),

              SizedBox(
                height: height / 26,
              ),
              InkWell(
                splashColor: DailozColor.transparent,
                highlightColor: const Color.fromRGBO(0, 0, 0, 0),
                onTap: () {
                  // Check if all text fields are filled
                  if (title.text.isEmpty ||
                      description.text.isEmpty ||
                      startdatetimeController.text.isEmpty ||
                      enddatetimeController.text.isEmpty) {
                    Get.snackbar(
                      "Error",
                      "Please fill all the fields.",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                    return;
                  }

                  // Check if at least one tag is selected
                  if (tagController.selectedTags.isEmpty) {
                    Get.snackbar(
                      "Error",
                      "Please select at least one tag.",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                    return;
                  }

                  // Proceed to save the data if all checks are passed
                  print("Title: ${title.text}");
                  print("Description: ${description.text}");
                  print(
                      "Status: ${type[checkBoxController.selectedCheckBox.value]}");
                  print("Tags: ${tagController.selectedTags.join(', ')}");
                  print("Start Date: ${startdatetimeController.text}");
                  print("End Date: ${enddatetimeController.text}");
                  print("ID: ${title.text} ${startdatetimeController.text}");

                  var data = taskModel(
                    tasktype: "Pending",
                    title: title.text,
                    description: description.text,
                    status: type[checkBoxController.selectedCheckBox.value],
                    tags: tagController
                        .selectedTags, // Store as comma-separated string
                    ID: '${title.text} ${startdatetimeController.text}',
                    starttime: startdatetimeController.text,
                    endtime: enddatetimeController.text,
                    startdate: selectedstartdate,
                    enddate: selectededdate,
                  );

                  final box = Boxes.getData();
                  box.add(data);
                  data.save();

                  Get.snackbar(
                    "Success",
                    "Task created successfully!",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                  );

                  if (widget.check == 1) {
                    Navigator.pop(context);
                  } else if (widget.check == 2) {
                    Get.to(DailozDashboard('1'));
                  } // Optionally, close the screen after saving
                },
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
