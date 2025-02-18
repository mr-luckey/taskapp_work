import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskapp_work/Controllers/task_controller.dart';
import 'package:taskapp_work/Widgets/cuntom%20cardprofile.dart';
import 'package:taskapp_work/Widgets/tile_card.dart';
import 'package:taskapp_work/boxes/boxes.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_color.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_fontstyle.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_icons.dart';
import 'package:taskapp_work/dailoz/dailoz_page/dailoz_task/Edittask.dart';
import 'package:taskapp_work/dailoz/dailoz_page/dailoz_task/dailoz_addtask.dart';
import 'package:taskapp_work/models/taskModel.dart';
import '../../dailoz_theme/dailoz_themecontroller.dart';
import '../dailoz_task/dailoz_taskdetail.dart';
import 'dailoz_addpersonal.dart';

class DailozEvent extends StatefulWidget {
  const DailozEvent({Key? key}) : super(key: key);

  @override
  State<DailozEvent> createState() => _DailozEventState();
}

class _DailozEventState extends State<DailozEvent> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  int isselected = 0;
  final themedata = Get.put(DailozThemecontroler());

  List name = ["Cleaning Clothes", "Cleaning Clothes", "Cleaning Clothes"];

  List day = ["MO", "TU", "WE", "TH", "FR", "SA", "SU", "MO", "TU", "WE"];
  List date = ["12", "13", "14", "15", "16", "17", "18", "19", "20", "21"];

  DateTime selectedDate = DateTime.now();
  ScrollController scrollController = ScrollController();
  final DailozTaskController controller = Get.put(DailozTaskController());

  List<String> listOfDays = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun"
  ]; //List of Days

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
          "Events".tr,
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
              // Row(
              //   children: [
              //     Text(
              //       "Task".tr,
              //       style: hsSemiBold.copyWith(fontSize: 24),
              //     ),
              //     const Spacer(),
              //     Image.asset(
              //       DailozPngimage.calendar,
              //       height: height / 46,
              //     ),
              //     SizedBox(
              //       width: width / 36,
              //     ),
              //     Text(
              //       "August 2021",
              //       style: hsRegular.copyWith(fontSize: 12),
              //     ),
              //   ],
              // ),

              // SizedBox(
              //   height: height / 36,
              // ),
              EasyDateTimeLine(
                initialDate: DateTime.now(),
                onDateChange: (selectedDate) {
                  setState(() {});
                  controller.updateSelectedDate(selectedDate);
                },
                activeColor: DailozColor.appcolor,
                dayProps: const EasyDayProps(
                  height: 70,
                  todayHighlightStyle: TodayHighlightStyle.withBackground,
                  todayHighlightColor: Colors.transparent,
                ),
              ),
              // SizedBox(
              //   height: height / 8.8,
              //   child: ListView.builder(
              //     itemCount: 31,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) {
              //       return InkWell(
              //         onTap: () {
              //           setState(() {
              //             isselected = index;
              //             selectedDate =
              //                 DateTime.now().add(Duration(days: index));
              //           });
              //         },
              //         child: Container(
              //           width: width / 7,
              //           margin: EdgeInsets.only(bottom: width / 30),
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(12),
              //               color: isselected == index
              //                   ? DailozColor.appcolor
              //                   : DailozColor.transparent),
              //           child: Padding(
              //             padding: EdgeInsets.symmetric(vertical: height / 96),
              //             child: Column(
              //               children: [
              //                 Text(
              //                   listOfDays[DateTime.now()
              //                               .add(Duration(days: index))
              //                               .weekday -
              //                           1]
              //                       .toString(),
              //                   style: hsMedium.copyWith(
              //                       fontSize: 16,
              //                       color: isselected == index
              //                           ? DailozColor.white
              //                           : themedata.isdark
              //                               ? DailozColor.white
              //                               : DailozColor.black),
              //                 ),
              //                 SizedBox(
              //                   height: height / 96,
              //                 ),
              //                 Text(
              //                   DateTime.now()
              //                       .add(Duration(days: index))
              //                       .day
              //                       .toString(),
              //                   style: hsRegular.copyWith(
              //                       fontSize: 14,
              //                       color: isselected == index
              //                           ? DailozColor.white
              //                           : themedata.isdark
              //                               ? DailozColor.white
              //                               : DailozColor.black),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),

              SizedBox(
                height: height / 56,
              ),
              Text(
                "Events".tr,
                style: hsSemiBold.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: height / 56,
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height,
              //   child: Obx(() {
              //     var data = Boxes.getData().values.toList().cast<taskModel>();

              //     // Filter tasks based on the selected date
              //     var tasksForSelectedDate = data.where((task) {
              //       return task.startdate ==
              //           controller.selectedDate.value
              //               .toLocal()
              //               .toString()
              //               .split(' ')[0];
              //     }).toList();

              //     // Filter tasks with 'Event' tag
              //     var eventTasks = tasksForSelectedDate.where((task) {
              //       return task.tags.contains('Event');
              //     }).toList();

              //     if (eventTasks.isEmpty) {
              //       return Center(
              //         child: Text('No events for the selected date',
              //             style: TextStyle(fontSize: 18, color: Colors.grey)),
              //       );
              //     }

              //     return ListView.builder(
              //       itemCount: eventTasks.length,
              //       physics: const NeverScrollableScrollPhysics(),
              //       shrinkWrap: true,
              //       itemBuilder: (context, index) {
              //         final task = eventTasks[index];
              //         print(task);

              //         return InkWell(
              //             splashColor: Colors.transparent,
              //             highlightColor: Colors.transparent,
              //             onTap: () {
              //               Navigator.push(context, MaterialPageRoute(
              //                 builder: (context) {
              //                   return DailozTaskdetail(
              //                       taskType: task.tasktype.toString(),
              //                       endDate: task.enddate.toString(),
              //                       startTime: task.starttime.toString(),
              //                       endTime: task.endtime.toString(),
              //                       taskDescription:
              //                           task.description.toString(),
              //                       tags: task.tags);
              //                 },
              //               ));
              //             },
              //             child: CustomDecoratedText(
              //                 title: task.title.toString(),
              //                 time: task.starttime.toString(),
              //                 tags: task.tags,
              //                 onEdit: () {
              //                   Get.to(DailozEditTask(
              //                       headtitle: "", existingTask: task));
              //                 },
              //                 onDelete: () {
              //                   task.delete();
              //                 }));
              //       },
              //     );
              //   }),
              // )
              ValueListenableBuilder(
                valueListenable: Boxes.getData().listenable(),
                builder: (context, Box box, _) {
                  var data = box.values.toList().cast<taskModel>();

                  // Filter tasks based on the selected date
                  var tasksForSelectedDate = data.where((task) {
                    return task.startdate ==
                        controller.selectedDate.value
                            .toLocal()
                            .toString()
                            .split(' ')[0];
                  }).toList();

                  // Filter tasks with 'Event' tag
                  var eventTasks = tasksForSelectedDate.where((task) {
                    return task.tags.contains('Event');
                  }).toList();

                  if (eventTasks.isEmpty) {
                    return Center(
                      child: Text('No events for the selected date',
                          style: TextStyle(fontSize: 18, color: Colors.grey)),
                    );
                  }

                  return ListView.builder(
                    itemCount: eventTasks.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final task = eventTasks[index];
                      print(task);

                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return DailozTaskdetail(
                                title: task.title.toString(),
                                taskType: task.tasktype.toString(),
                                endDate: task.enddate.toString(),
                                startTime: task.starttime.toString(),
                                endTime: task.endtime.toString(),
                                taskDescription: task.description.toString(),
                                tags: task.tags,
                              );
                            },
                          ));
                        },
                        child: CustomDecoratedText(
                          title: task.title.toString(),
                          time: task.starttime.toString(),
                          tags: task.tags,
                          onEdit: () {
                            Get.to(DailozEditTask(
                                headtitle: "", existingTask: task));
                          },
                          onDelete: () {
                            task.delete();
                          },
                        ),
                      );
                    },
                  );
                },
              )

              // //TODO: List of EventS from database
              // SizedBox(
              //   height: MediaQuery.of(context).size.height,
              //   child: ValueListenableBuilder<Box<taskModel>>(
              //     valueListenable: Boxes.getData().listenable(),
              //     builder: (context, box, _) {
              //       var data = box.values.toList().cast<taskModel>();

              //       var eventstask = data.where((task) {
              //         return task.tags.contains('Event');
              //       }).toList();

              //       return ListView.builder(
              //         itemCount: eventstask.length,
              //         physics: const NeverScrollableScrollPhysics(),
              //         shrinkWrap: true,
              //         itemBuilder: (context, index) {
              //           final task = eventstask[index];
              //           print(task);

              //           return InkWell(
              //             splashColor: Colors.transparent,
              //             highlightColor: Colors.transparent,
              //             onTap: () {
              //               Navigator.push(context, MaterialPageRoute(
              //                 builder: (context) {
              //                   return const DailozTaskdetail();
              //                 },
              //               ));
              //             },
              //             child: TaskCard(
              //               title: task.title ??
              //                   'No Title', // Handle nullable title
              //               startTime: task.starttime ??
              //                   'No Start Time', // Handle nullable start time
              //               endTime: task.endtime ??
              //                   'No End Time', // Handle nullable end time
              //               tags: task.tags ?? [], // Handle nullable tags
              //             ),
              //           );
              //         },
              //       );
              //     },
              //   ),
              // )

              // ListView.builder(
              //   itemCount: 3,
              //   physics: const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   itemBuilder: (context, index) {
              //     return InkWell(
              //       splashColor: DailozColor.transparent,
              //       highlightColor: DailozColor.transparent,
              //       onTap: () {
              //         Navigator.push(context, MaterialPageRoute(
              //           builder: (context) {
              //             return const DailozTaskdetail();
              //           },
              //         ));
              //       },
              //       child: Container(
              //         margin: EdgeInsets.only(bottom: height / 46),
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(14),
              //             color: DailozColor.bgpurple),
              //         child: Padding(
              //           padding: EdgeInsets.symmetric(
              //               horizontal: width / 36, vertical: height / 66),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Row(
              //                 children: [
              //                   Text(
              //                     "Cleaning Clothes",
              //                     style: hsMedium.copyWith(
              //                         fontSize: 16, color: DailozColor.black),
              //                   ),
              //                   const Spacer(),
              //                   Image.asset(
              //                     DailozPngimage.dot,
              //                     height: height / 36,
              //                   )
              //                 ],
              //               ),
              //               SizedBox(
              //                 height: height / 200,
              //               ),
              //               Text(
              //                 "07:00 - 07:15",
              //                 style: hsRegular.copyWith(
              //                     fontSize: 14, color: DailozColor.textgray),
              //               ),
              //               SizedBox(
              //                 height: height / 66,
              //               ),
              //               Row(
              //                 children: [
              //                   Container(
              //                       decoration: BoxDecoration(
              //                           color: const Color(0xffECEAFF),
              //                           borderRadius: BorderRadius.circular(5)),
              //                       child: Padding(
              //                         padding: EdgeInsets.symmetric(
              //                             horizontal: width / 36,
              //                             vertical: height / 120),
              //                         child: Text(
              //                           "Urgent",
              //                           style: hsMedium.copyWith(
              //                               fontSize: 10,
              //                               color: DailozColor.purple),
              //                         ),
              //                       )),
              //                   SizedBox(
              //                     width: width / 36,
              //                   ),
              //                   Container(
              //                       decoration: BoxDecoration(
              //                           color: const Color(0xffECEAFF),
              //                           borderRadius: BorderRadius.circular(5)),
              //                       child: Padding(
              //                         padding: EdgeInsets.symmetric(
              //                             horizontal: width / 36,
              //                             vertical: height / 120),
              //                         child: Text(
              //                           "Home",
              //                           style: hsMedium.copyWith(
              //                               fontSize: 10,
              //                               color: DailozColor.purple),
              //                         ),
              //                       )),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: DailozColor.appcolor,
        onPressed: () {
          Get.to(DailozAddTask(
            check: 1,
            headtitle: "Event",
          ));
        },
        child: const Icon(
          Icons.add,
          size: 22,
          color: DailozColor.white,
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: DailozColor.appcolor,
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(
      //       builder: (context) {
      //         return DailozAddPersonal("event");
      //       },
      //     ));
      //   },
      //   child: const Icon(
      //     Icons.add,
      //     size: 22,
      //     color: DailozColor.white,
      //   ),
      // ),
    );
  }
}
