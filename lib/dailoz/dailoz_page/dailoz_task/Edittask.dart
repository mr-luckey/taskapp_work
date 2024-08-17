import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp_work/Controllers/addtaskController.dart';
import 'package:taskapp_work/boxes/boxes.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_color.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_fontstyle.dart';
import 'package:taskapp_work/models/taskModel.dart';
import '../../dailoz_theme/dailoz_themecontroller.dart';

class DailozEditTask extends StatefulWidget {
  final String headtitle;
  final taskModel existingTask; // Pass the existing task data

  DailozEditTask({
    Key? key,
    required this.headtitle,
    required this.existingTask,
  }) : super(key: key);

  @override
  State<DailozEditTask> createState() => _DailozEditTaskState();
}

class _DailozEditTaskState extends State<DailozEditTask> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;

  final TextEditingController startdatetimeController = TextEditingController();
  final TextEditingController enddatetimeController = TextEditingController();
  final themedata = Get.put(DailozThemecontroler());

  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();

  final CheckBoxController checkBoxController = Get.put(CheckBoxController());
  final TagController tagController = Get.put(TagController());
  String selectedstartdate = '';
  String selectededdate = '';
  DateTime? _pickedDate;
  TimeOfDay? _pickedTime;

  @override
  void initState() {
    super.initState();

    // Pre-fill the fields with existing data
    title.text = widget.existingTask.title!;
    description.text = widget.existingTask.description!;
    startdatetimeController.text = widget.existingTask.starttime!;
    enddatetimeController.text = widget.existingTask.endtime!;

    // Set the selected checkbox and tags
    checkBoxController.selectedCheckBox.value =
        widget.existingTask.status == "Personal"
            ? 0
            : widget.existingTask.status == "Private"
                ? 1
                : 2;
    tagController.selectedTags = widget.existingTask.tags;
  }

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
          "Edit ${widget.headtitle} Task".tr,
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
              // Title field
              Text(
                "Title".tr,
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
              SizedBox(height: height / 36),

              // Date & Time fields
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
                      onTap: () => _selectstartDate(context),
                      child: TextField(
                        controller: startdatetimeController,
                        readOnly: true,
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
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: width / 2.2,
                    child: TextField(
                      onTap: () => _endselectDate(context),
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
              SizedBox(height: height / 36),

              // Description field
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
              SizedBox(height: height / 36),

              // Type field
              Text(
                "Type".tr,
                style: hsSemiBold.copyWith(
                    fontSize: 14, color: DailozColor.textgray),
              ),
              SizedBox(height: height / 36),
              SizedBox(
                height: height / 26,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: width / 20),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          checkBoxController.updateCheckBox(index);
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
                                SizedBox(width: width / 36),
                                Text(
                                  ['Personal', 'Private', 'Secret'][index],
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            )),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: height / 36),

              // Tags field
              Text(
                "Tags".tr,
                style: hsSemiBold.copyWith(
                    fontSize: 14, color: DailozColor.textgray),
              ),
              SizedBox(height: height / 36),
              // SizedBox(
              //   height: height / 20,
              //   child: ListView.builder(
              //     itemCount: tagController.tags.length,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: EdgeInsets.only(right: width / 20),
              //         child: InkWell(
              //           splashColor: Colors.transparent,
              //           highlightColor: Colors.transparent,
              //           onTap: () {
              //             tagController.toggleTagSelection(index);
              //           },
              //           child: Obx(() => Container(
              //                 padding: EdgeInsets.symmetric(
              //                     horizontal: width / 36,
              //                     vertical: height / 100),
              //                 decoration: BoxDecoration(
              //                     color: tagController
              //                             .selectedTags.contains(
              //                                 tagController.tags[index])
              //                         ? Colors.blue
              //                         : Colors.grey.shade200,
              //                     borderRadius: BorderRadius.circular(8)),
              //                 child: Text(
              //                   tagController.tags[index],
              //                   style: TextStyle(
              //                       color: tagController.selectedTags.contains(
              //                               tagController.tags[index])
              //                           ? Colors.white
              //                           : Colors.black),
              //                 ),
              //               )),
              //         ),
              //       );
              //     },
              //   ),
              // ),

              // // Save Button
              SizedBox(height: height / 20),
              Center(
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    final taskBox = Boxes.getData();
                    final task = widget.existingTask;

                    // Update task properties
                    task.title = title.text;
                    task.description = description.text;
                    task.starttime = startdatetimeController.text;
                    task.endtime = enddatetimeController.text;
                    task.status = checkBoxController.selectedCheckBox.value == 0
                        ? "Personal"
                        : checkBoxController.selectedCheckBox.value == 1
                            ? "Private"
                            : "Secret";
                    task.tags = tagController.selectedTags;

                    // Save the task
                    await taskBox.put(task.key, task);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: height / 16,
                    width: width / 1.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        "Save",
                        style: hsMedium.copyWith(
                            fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
