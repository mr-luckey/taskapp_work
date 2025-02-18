import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:taskapp_work/Widgets/square_Card.dart';
import 'package:taskapp_work/boxes/boxes.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_color.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_fontstyle.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_icons.dart';
import 'package:taskapp_work/dailoz/dailoz_page/dailoz_home/dailoz_dashboard.dart';
import 'package:taskapp_work/dailoz/dailoz_page/dailoz_home/dailoz_home.dart';
import 'package:taskapp_work/dailoz/dailoz_page/dailoz_task/Edittask.dart';
import 'package:taskapp_work/dailoz/dailoz_page/dailoz_task/dailoz_taskdetail.dart';
import 'package:taskapp_work/models/taskModel.dart';

// ignore: must_be_immutable
class DailozMyTask extends StatefulWidget {
  String? type;
  DailozMyTask(this.type, {super.key});

  @override
  State<DailozMyTask> createState() => _DailozMyTaskState();
}

class _DailozMyTaskState extends State<DailozMyTask> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  DateTime? _selectedDay;
  String? selectdate;

  List tag = ["Office", "Home", "Urgent", "Work"];
  List type = ["Private", "Personal", "Secret"];
  List shot = ["Newest", "Farthest"];
  List typecolor = [
    DailozColor.purple,
    DailozColor.lightred,
    DailozColor.lightblue,
  ];

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

  @override
  Widget build(BuildContext context) {
    // var taskbox = Hive.box<taskModel>('task');
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return WillPopScope(
      onWillPop: () async {
        Get.to(DailozDashboard(0));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              splashColor: DailozColor.transparent,
              highlightColor: DailozColor.transparent,
              onTap: () {
                Get.to(DailozDashboard(0));
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
            widget.type == "Completed"
                ? "Completed Task".tr
                : widget.type == "Canceled"
                    ? "Canceled".tr
                    : widget.type == "Pending"
                        ? "Pending".tr
                        : "On_Going".tr,
            style: hsSemiBold.copyWith(fontSize: 18),
          ),
        ),
        body: widget.type == "Completed"
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: height / 1,
                  child: ValueListenableBuilder<Box<taskModel>>(
                    valueListenable: Boxes.getData().listenable(),
                    builder: (context, box, _) {
                      var data = box.values.toList().cast<taskModel>();
                      var pendingTasks = data
                          .where((task) => task.tasktype == 'Completed')
                          .toList();

                      return GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        mainAxisSpacing: 10,
                        children:
                            List<Widget>.generate(pendingTasks.length, (index) {
                          if (index < pendingTasks.length) {
                            return InkWell(
                              onTap: () {
                                Get.to(DailozTaskdetail(
                                    title: pendingTasks[index].title.toString(),
                                    taskType:
                                        pendingTasks[index].tasktype.toString(),
                                    endDate:
                                        pendingTasks[index].enddate.toString(),
                                    startTime: pendingTasks[index]
                                        .starttime
                                        .toString(),
                                    endTime:
                                        pendingTasks[index].endtime.toString(),
                                    taskDescription: pendingTasks[index]
                                        .description
                                        .toString(),
                                    tags: pendingTasks[index].tags));
                              },
                              child: ReusableContainer(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                tags: pendingTasks[index].tags,
                                title: pendingTasks[index].title.toString(),
                                time:
                                    "${pendingTasks[index].starttime.toString()} - ${pendingTasks[index].endtime.toString()}",
                                // urgency: 'Urgent',
                                location: pendingTasks[index].status.toString(),
                                type: pendingTasks[index].tasktype.toString(),
                                onMenuItemSelected: (value) {
                                  if (value == 1) {
                                    var task = pendingTasks[index];
                                    task.tasktype = 'On_Going';
                                    task.save();
                                    print(
                                        "woking fine and go "); //TODO: go to database tasktype update in pending case ongoing can mark completed on going can mark
                                  }
                                  if (value == 3) {
                                    pendingTasks[index].delete();
                                  }
                                  if (value == 4) {
                                    pendingTasks[index].delete();
                                  }
                                },
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        }),
                      );
                    },
                  ),
                ),
              ) //TODO: pending widgets build here

            //TODO: completed widgets build here
            : widget.type == "Canceled"
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: height / 1,
                      child: ValueListenableBuilder<Box<taskModel>>(
                        valueListenable: Boxes.getData().listenable(),
                        builder: (context, box, _) {
                          var data = box.values.toList().cast<taskModel>();
                          var pendingTasks = data
                              .where((task) => task.tasktype == 'Canceled')
                              .toList();

                          return GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            mainAxisSpacing: 10,
                            children: List<Widget>.generate(pendingTasks.length,
                                (index) {
                              if (index < pendingTasks.length) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(DailozTaskdetail(
                                        title: pendingTasks[index]
                                            .title
                                            .toString(),
                                        taskType: pendingTasks[index]
                                            .tasktype
                                            .toString(),
                                        endDate: pendingTasks[index]
                                            .enddate
                                            .toString(),
                                        startTime: pendingTasks[index]
                                            .starttime
                                            .toString(),
                                        endTime: pendingTasks[index]
                                            .endtime
                                            .toString(),
                                        taskDescription: pendingTasks[index]
                                            .description
                                            .toString(),
                                        tags: pendingTasks[index].tags));
                                  },
                                  child: ReusableContainer(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    title: pendingTasks[index].title.toString(),
                                    time:
                                        "${pendingTasks[index].starttime.toString()} - ${pendingTasks[index].endtime.toString()}",
                                    tags: pendingTasks[index].tags,
                                    location:
                                        pendingTasks[index].status.toString(),
                                    type:
                                        pendingTasks[index].tasktype.toString(),
                                    onMenuItemSelected: (value) {
                                      if (value == 1) {
                                        print(
                                            "woking fine and go "); //TODO: go to database tasktype update in pending case ongoing can mark completed on going can mark
                                        var task = pendingTasks[index];
                                        print(task);
                                        task.tasktype = 'On_Going';
                                        task.save();
                                        print(
                                            "woking fine and go "); //TODO: go to database tasktype update in pending case ongoing can mark completed on going can mark
                                      }
                                      if (value == 2) {
                                        pendingTasks[index].delete();
                                      }
                                      // if (value == 1) {
                                      //   var task = pendingTasks[index];
                                      //   task.tasktype = 'On_Going';
                                      //   task.save();
                                      //   print(
                                      //       "woking fine and go "); //TODO: go to database tasktype update in pending case ongoing can mark completed on going can mark
                                      // }
                                    },
                                  ),
                                );
                              } else {
                                return SizedBox.shrink();
                              }
                            }),
                          );
                        },
                      ),
                    ),
                  ) //TODO: pending widgets build here
                //TODO: canceled widgets build here
                : widget.type == "Pending"
                    ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: height / 1,
                          child: ValueListenableBuilder<Box<taskModel>>(
                            valueListenable: Boxes.getData().listenable(),
                            builder: (context, box, _) {
                              var data = box.values.toList().cast<taskModel>();
                              var pendingTasks = data
                                  .where((task) => task.tasktype == 'Pending')
                                  .toList();

                              return GridView.count(
                                crossAxisCount: 2,
                                shrinkWrap: true,
                                mainAxisSpacing: 10,
                                children: List<Widget>.generate(
                                    pendingTasks.length, (index) {
                                  if (index < pendingTasks.length) {
                                    return InkWell(
                                      onTap: () {
                                        Get.to(DailozTaskdetail(
                                            title: pendingTasks[index]
                                                .title
                                                .toString(),
                                            taskType: pendingTasks[index]
                                                .tasktype
                                                .toString(),
                                            endDate: pendingTasks[index]
                                                .enddate
                                                .toString(),
                                            startTime: pendingTasks[index]
                                                .starttime
                                                .toString(),
                                            endTime: pendingTasks[index]
                                                .endtime
                                                .toString(),
                                            taskDescription: pendingTasks[index]
                                                .description
                                                .toString(),
                                            tags: pendingTasks[index].tags));
                                      },
                                      child: ReusableContainer(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        title: pendingTasks[index]
                                            .title
                                            .toString(),
                                        tags: pendingTasks[index].tags,
                                        time:
                                            "${pendingTasks[index].starttime.toString()} - ${pendingTasks[index].endtime.toString()}",
                                        // urgency: 'Urgent',
                                        location: pendingTasks[index]
                                            .status
                                            .toString(),
                                        type: pendingTasks[index]
                                            .tasktype
                                            .toString(),
                                        onMenuItemSelected: (value) {
                                          if (value == 1) {
                                            var task = pendingTasks[index];
                                            task.tasktype = 'Completed';
                                            task.save();
                                            print(
                                                "woking fine and go "); //TODO: go to database tasktype update in pending case ongoing can mark completed on going can mark
                                          } else if (value == 2) {
                                            var task = pendingTasks[index];
                                            task.tasktype = 'On_Going';
                                            task.save();
                                            print(
                                                "woking fine and go "); //TODO: go to database tasktype update in pending case ongoing can mark completed on going can mark
                                          } else if (value == 3) {
                                            var task = pendingTasks[index];
                                            task.tasktype = 'Canceled';
                                            task.save();
                                            print(
                                                "woking fine and go "); //TODO: go to database tasktype update in pending case ongoing can mark completed on going can mark
                                          }
                                          if (value == 4) {
                                            Get.to(DailozEditTask(
                                              existingTask: pendingTasks[index],
                                              headtitle: '',
                                            ));
                                          }
                                          if (value == 5) {
                                            pendingTasks[index].delete();
                                          }
                                        },
                                      ),
                                    );
                                  } else {
                                    return SizedBox.shrink();
                                  }
                                }),
                              );
                            },
                          ),
                        ),
                      ) //TODO: pending widgets build here

                    : Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: height / 1,
                          child: ValueListenableBuilder<Box<taskModel>>(
                            valueListenable: Boxes.getData().listenable(),
                            builder: (context, box, _) {
                              var data = box.values.toList().cast<taskModel>();
                              var pendingTasks = data
                                  .where((task) => task.tasktype == 'On_Going')
                                  .toList();

                              return GridView.count(
                                crossAxisCount: 2,
                                shrinkWrap: true,
                                mainAxisSpacing: 10,
                                children: List<Widget>.generate(
                                    pendingTasks.length, (index) {
                                  if (index < pendingTasks.length) {
                                    return InkWell(
                                      onTap: () {
                                        Get.to(DailozTaskdetail(
                                            title: pendingTasks[index]
                                                .title
                                                .toString(),
                                            taskType: pendingTasks[index]
                                                .tasktype
                                                .toString(),
                                            endDate: pendingTasks[index]
                                                .enddate
                                                .toString(),
                                            startTime: pendingTasks[index]
                                                .starttime
                                                .toString(),
                                            endTime: pendingTasks[index]
                                                .endtime
                                                .toString(),
                                            taskDescription: pendingTasks[index]
                                                .description
                                                .toString(),
                                            tags: pendingTasks[index].tags));
                                      },
                                      child: ReusableContainer(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        title: pendingTasks[index]
                                            .title
                                            .toString(),
                                        time:
                                            "${pendingTasks[index].starttime.toString()} - ${pendingTasks[index].endtime.toString()}",
                                        tags: pendingTasks[index].tags,
                                        // urgency: 'Urgent',
                                        location: pendingTasks[index]
                                            .status
                                            .toString(),
                                        type: pendingTasks[index]
                                            .tasktype
                                            .toString(),
                                        onMenuItemSelected: (value) {
                                          if (value == 1) {
                                            var task = pendingTasks[index];
                                            task.tasktype = 'Completed';
                                            task.save();
                                            print(
                                                "woking fine and go "); //TODO: go to database tasktype update in pending case ongoing can mark completed on going can mark
                                          } else if (value == 2) {
                                            var task = pendingTasks[index];
                                            task.tasktype = 'Pending';
                                            task.save();
                                            print(
                                                "woking fine and go "); //TODO: go to database tasktype update in pending case ongoing can mark completed on going can mark
                                          } else if (value == 3) {
                                            var task = pendingTasks[index];
                                            task.tasktype = 'Canceled';
                                            task.save();
                                            print(
                                                "woking fine and go "); //TODO: go to database tasktype update in pending case ongoing can mark completed on going can mark
                                          }
                                          if (value == 4) {
                                            pendingTasks[index].delete();
                                          }
                                        },
                                      ),
                                    );
                                  } else {
                                    return SizedBox.shrink();
                                  }
                                }),
                              );
                            },
                          ),
                        ),
                      ) //TODO: pending widgets build here
        , //TODO: on going widgets build here
        //       SingleChildScrollView(
        //         child: Padding(
        //           padding: EdgeInsets.symmetric(
        //               horizontal: width / 36, vertical: height / 36),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Row(
        //                 children: [
        //                   SizedBox(
        //                     width: width / 1.35,
        //                     child: TextFormField(
        //                         cursorColor: DailozColor.black,
        //                         style: hsMedium.copyWith(
        //                             fontSize: 16, color: DailozColor.textgray),
        //                         decoration: InputDecoration(
        //                           hintText: 'Search for task'.tr,
        //                           filled: true,
        //                           fillColor: DailozColor.bggray,
        //                           prefixIcon: const Icon(
        //                             Icons.search,
        //                             size: 22,
        //                             color: DailozColor.grey,
        //                           ),
        //                           suffixIcon: Padding(
        //                             padding: const EdgeInsets.all(14),
        //                             child: Container(
        //                               height: height / 96,
        //                               width: height / 96,
        //                               decoration: BoxDecoration(
        //                                   borderRadius: BorderRadius.circular(5),
        //                                   color: DailozColor.textgray),
        //                               child: const Icon(
        //                                 Icons.close,
        //                                 size: 12,
        //                                 color: DailozColor.white,
        //                               ),
        //                             ),
        //                           ),
        //                           hintStyle: hsMedium.copyWith(
        //                               fontSize: 16, color: DailozColor.textgray),
        //                           border: OutlineInputBorder(
        //                               borderRadius: BorderRadius.circular(15),
        //                               borderSide: BorderSide.none),
        //                           focusedBorder: OutlineInputBorder(
        //                               borderRadius: BorderRadius.circular(15),
        //                               borderSide: BorderSide.none),
        //                         )),
        //                   ),
        //                   const Spacer(),
        //                   InkWell(
        //                     splashColor: DailozColor.transparent,
        //                     highlightColor: DailozColor.transparent,
        //                     onTap: () {
        //                       filter();
        //                     },
        //                     child: Container(
        //                         height: height / 13,
        //                         width: height / 13,
        //                         decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.circular(14),
        //                           color: DailozColor.bggray,
        //                         ),
        //                         child: Padding(
        //                           padding: const EdgeInsets.all(13),
        //                           child: Image.asset(
        //                             DailozPngimage.filter,
        //                             height: height / 36,
        //                           ),
        //                         )),
        //                   ),
        //                 ],
        //               ),
        //               SizedBox(
        //                 height: height / 36,
        //               ),
        //               Row(
        //                 children: [
        //                   InkWell(
        //                       splashColor: DailozColor.transparent,
        //                       highlightColor: DailozColor.transparent,
        //                       onTap: () {
        //                         calendar();
        //                       },
        //                       child: Image.asset(
        //                         DailozPngimage.calendar,
        //                         height: height / 36,
        //                       )),
        //                   SizedBox(
        //                     width: width / 30,
        //                   ),
        //                   // Text(
        //                   //   "May 2021",
        //                   //   style: hsMedium.copyWith(fontSize: 20),
        //                   // ),
        //                 ],
        //               ),
        //               SizedBox(
        //                 height: height / 36,
        //               ),
        // //TODO: will fix the UI later it should be date wise like
        // // today should show on today and rest of pending
        // //task should be in under different dates

        //               SizedBox(
        //                   height: height / 5.7,
        //                   child: ValueListenableBuilder<Box<taskModel>>(
        //                     valueListenable: Boxes.getData().listenable(),
        //                     builder: (context, box, _) {
        //                       // var data = box.values.toList().cast<taskModel>();
        //                       var data = box.values.toList().cast<taskModel>();
        //                       return new GridView.count(
        //                         crossAxisCount: 2,
        //                         children:
        //                             new List<Widget>.generate(box.length, (index) {
        //                           return ReusableContainer(
        //                               width: MediaQuery.of(context).size.width,
        //                               height: MediaQuery.of(context).size.height,
        //                               title: data[index].title.toString(),
        //                               time: '7:90',
        //                               urgency: 'Urgent',
        //                               location: data[index].status.toString(),
        //                               type: data[index].tasktype.toString(),
        //                               onMenuItemSelected: (value) {
        //                                 if (value == 1) {}
        //                               });
        //                         }),
        //                       );
        //                     },
        //                   )),
        //             ],
        //           ),
        //         ),
        //       ),
      ),
    );
  }
  //TODO: Here is the UI of the all task date wise

  Future<bool> calendar() async {
    return await showDialog(
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                Column(
                  children: [
                    TableCalendar(
                      firstDay: DateTime.now(),
                      focusedDay: DateTime.now(),
                      lastDay: DateTime.utc(2050, 3, 14),
                      headerVisible: true,
                      daysOfWeekVisible: true,
                      calendarStyle: const CalendarStyle(
                        todayDecoration: BoxDecoration(
                          color: DailozColor.appcolor,
                          shape: BoxShape.circle,
                        ),
                        todayTextStyle: TextStyle(
                          color: DailozColor.white,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: DailozColor.appcolor,
                          shape: BoxShape.circle,
                        ),
                        selectedTextStyle: TextStyle(
                          color: DailozColor.white,
                        ),
                      ),
                      shouldFillViewport: false,
                      currentDay: _selectedDay,
                      calendarFormat: CalendarFormat.month,
                      pageAnimationEnabled: false,
                      headerStyle: HeaderStyle(
                          leftChevronIcon: SizedBox(
                            height: height / 26,
                            width: height / 26,
                            child: const Icon(
                              Icons.chevron_left,
                              color: DailozColor.textgray,
                            ),
                          ),
                          rightChevronIcon: SizedBox(
                              height: height / 26,
                              width: height / 26,
                              child: const Icon(
                                Icons.chevron_right,
                                color: DailozColor.textgray,
                              )),
                          formatButtonVisible: false,
                          decoration: const BoxDecoration(
                            color: DailozColor.transparent,
                          ),
                          titleCentered: true,
                          titleTextStyle: hsBold.copyWith(
                            fontSize: 16,
                            color: DailozColor.black,
                          )),
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          /*  String convertdate = FormatedDate(_selectedDay.toString());
                      selectdate = convertdate;*/
                          // Navigator.pop(context);
                        });
                      },
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
                                  border:
                                      Border.all(color: DailozColor.appcolor)),
                              child: Center(
                                  child: Text(
                                "Cancel".tr,
                                style: hsRegular.copyWith(
                                    fontSize: 14, color: DailozColor.appcolor),
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
                )
              ],
            ),
        context: context);
  }

  Future<bool> filter() async {
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sort_by_tag".tr,
                        style: hsMedium.copyWith(fontSize: 15),
                      ),
                      SizedBox(
                        height: height / 56,
                      ),
                      SizedBox(
                        height: height / 21,
                        child: ListView.builder(
                          itemCount: tag.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: width / 36),
                              height: height / 22,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: color[index]),
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width / 20),
                                child: Text(
                                  tag[index],
                                  style: hsRegular.copyWith(
                                      fontSize: 14, color: textcolor[index]),
                                ),
                              )),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: height / 36,
                      ),
                      Text(
                        "Sort_by_type".tr,
                        style: hsMedium.copyWith(fontSize: 15),
                      ),
                      SizedBox(
                        height: height / 56,
                      ),
                      SizedBox(
                        height: height / 21,
                        child: ListView.builder(
                          itemCount: type.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: width / 36),
                              height: height / 22,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: typecolor[index]),
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width / 20),
                                child: Text(
                                  type[index],
                                  style: hsRegular.copyWith(
                                      fontSize: 14, color: DailozColor.white),
                                ),
                              )),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: height / 36,
                      ),
                      Text(
                        "Sort_by".tr,
                        style: hsMedium.copyWith(fontSize: 15),
                      ),
                      SizedBox(
                        height: height / 56,
                      ),
                      SizedBox(
                        height: height / 21,
                        child: ListView.builder(
                          itemCount: shot.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: width / 36),
                              height: height / 22,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: DailozColor.bggray),
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width / 20),
                                child: Text(
                                  shot[index],
                                  style: hsRegular.copyWith(
                                      fontSize: 14, color: DailozColor.black),
                                ),
                              )),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: height / 26,
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
                                "Filter".tr,
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
