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

import '../../../models/taskModel.dart';
import '../dailoz_task/dailoz_taskdetail.dart';
import 'dailoz_mytask.dart';

class Dailozhome extends StatefulWidget {
  const Dailozhome({Key? key}) : super(key: key);

  @override
  State<Dailozhome> createState() => _DailozhomeState();
}

class _DailozhomeState extends State<Dailozhome> {
  final TaskController taskcc = Get.put(TaskController());
  dynamic size;
  double height = 0.00;
  double width = 0.00;

  var data = Boxes.getData().values.toList().cast<taskModel>();
  // @override
  // void didchangeDependencies() {
  //   print("didchange");
  //   print(
  //       "${taskcc.completedTasks}  ${taskcc.pendingTasks} ${taskcc.ongoingTasks} ${taskcc.cancelTasks}");
  //   taskcc.pendingTasks;
  //   taskcc.completedTasks;
  //   taskcc.ongoingTasks;
  //   taskcc.cancelTasks;
  //   taskcc.fetchTasks();
  //   setState(() {});
  //   super.didChangeDependencies();
  // }
  @override
  void initState() {
    taskcc.fetchTasks();
    setState(() {
      print("didchange");
      print(
          "${taskcc.completedTasks}  ${taskcc.pendingTasks} ${taskcc.ongoingTasks} ${taskcc.cancelTasks}");
      taskcc.pendingTasks;
      taskcc.completedTasks;
      taskcc.ongoingTasks;
      taskcc.cancelTasks;
      taskcc.fetchTasks();
      // setState(() {});
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height / 96,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, Steven".tr,
                        style: hsSemiBold.copyWith(fontSize: 26),
                      ),
                      Text(
                        "Let’s make this day productive".tr,
                        style: hsRegular.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: height / 16,
                    height: height / 16,
                    decoration: BoxDecoration(
                        color: DailozColor.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: const [
                          BoxShadow(color: DailozColor.textgray, blurRadius: 5)
                        ]),
                    child: Image.asset(
                      DailozPngimage.avtar,
                      height: height / 36,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height / 36,
              ),
              Text(
                "My_Task".tr,
                style: hsSemiBold.copyWith(fontSize: 24),
              ),
              SizedBox(
                height: height / 36,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      InkWell(
                        splashColor: DailozColor.transparent,
                        highlightColor: DailozColor.transparent,
                        onTap: () {
                          // setState(() {
                          //   taskcc.fetchTasks();
                          // });
                          Get.offAll(DailozMyTask("Completed"));
                          // Navigator.push(context, MaterialPageRoute(
                          //   builder: (context) {
                          //     print(taskcc.completedTasks);
                          //     print(taskcc.pendingTasks);
                          //     print(taskcc.ongoingTasks);
                          //     print(taskcc.cancelTasks);
                          //     return DailozMyTask("Completed");
                          //   },
                          // ));
                        },
                        child: Container(
                          height: height / 4.5,
                          width: width / 2.2,
                          decoration: BoxDecoration(
                              color: DailozColor.lightblue,
                              borderRadius: BorderRadius.circular(14)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width / 36, vertical: height / 66),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      DailozPngimage.iMac,
                                      height: height / 10,
                                      fit: BoxFit.fitHeight,
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: DailozColor.black,
                                      size: 22,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: height / 66,
                                ),
                                Text(
                                  "Completed".tr,
                                  style: hsMedium.copyWith(
                                      fontSize: 16, color: DailozColor.black),
                                ),
                                SizedBox(
                                  height: height / 120,
                                ),
                                Text(
                                  "${taskcc.completedTasks} Task",
                                  style: hsRegular.copyWith(
                                      fontSize: 14, color: DailozColor.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 56,
                      ),
                      InkWell(
                        splashColor: DailozColor.transparent,
                        highlightColor: DailozColor.transparent,
                        onTap: () {
                          Get.offAll(DailozMyTask("Canceled"));
                          // setState(() {
                          //   taskcc.fetchTasks();
                          // });
                          // Navigator.push(context, MaterialPageRoute(
                          //   builder: (context) {
                          //     return DailozMyTask("Canceled");
                          //   },
                          // ));
                        },
                        child: Container(
                          height: height / 6,
                          width: width / 2.2,
                          decoration: BoxDecoration(
                              color: DailozColor.lightred,
                              borderRadius: BorderRadius.circular(14)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width / 36, vertical: height / 66),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      DailozPngimage.closeSquare,
                                      height: height / 21,
                                      fit: BoxFit.fitHeight,
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: DailozColor.white,
                                      size: 22,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: height / 66,
                                ),
                                Text(
                                  "Canceled".tr,
                                  style: hsMedium.copyWith(
                                      fontSize: 16, color: DailozColor.white),
                                ),
                                SizedBox(
                                  height: height / 120,
                                ),
                                Text(
                                  "${taskcc.cancelTasks} Task",
                                  style: hsRegular.copyWith(
                                      fontSize: 14, color: DailozColor.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      InkWell(
                        splashColor: DailozColor.transparent,
                        highlightColor: DailozColor.transparent,
                        onTap: () {
                          Get.offAll(DailozMyTask("Pending"));
                          // setState(() {
                          //   taskcc.fetchTasks();
                          // });
                          // Navigator.push(context, MaterialPageRoute(
                          //   builder: (context) {
                          //     return DailozMyTask("Pending");
                          //   },
                          // ));
                        },
                        child: Container(
                          height: height / 6,
                          width: width / 2.2,
                          decoration: BoxDecoration(
                              color: DailozColor.purple,
                              borderRadius: BorderRadius.circular(14)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width / 36, vertical: height / 66),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      DailozPngimage.timeSquare,
                                      height: height / 21,
                                      fit: BoxFit.fitHeight,
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: DailozColor.white,
                                      size: 22,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: height / 66,
                                ),
                                Text(
                                  "Pending".tr,
                                  style: hsMedium.copyWith(
                                      fontSize: 16, color: DailozColor.white),
                                ),
                                SizedBox(
                                  height: height / 120,
                                ),
                                Text(
                                  "${taskcc.pendingTasks} Task",
                                  style: hsRegular.copyWith(
                                      fontSize: 14, color: DailozColor.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 56,
                      ),
                      InkWell(
                        splashColor: DailozColor.transparent,
                        highlightColor: DailozColor.transparent,
                        onTap: () {
                          Get.offAll(DailozMyTask("OnGoing"));
                          // setState(() {
                          //   taskcc.fetchTasks();
                          // });
                          // Navigator.push(context, MaterialPageRoute(
                          //   builder: (context) {
                          //     return DailozMyTask("OnGoing");
                          //   },
                          // ));
                        },
                        child: Container(
                          height: height / 4.5,
                          width: width / 2.2,
                          decoration: BoxDecoration(
                              color: DailozColor.lightgreen,
                              borderRadius: BorderRadius.circular(14)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width / 36, vertical: height / 66),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      DailozPngimage.iMac,
                                      height: height / 10,
                                      fit: BoxFit.fitHeight,
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: DailozColor.black,
                                      size: 22,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: height / 66,
                                ),
                                Text(
                                  "On_Going".tr,
                                  style: hsMedium.copyWith(
                                      fontSize: 16, color: DailozColor.black),
                                ),
                                SizedBox(
                                  height: height / 120,
                                ),
                                Text(
                                  taskcc.ongoingTasks.toString() + " Task",
                                  style: hsRegular.copyWith(
                                      fontSize: 14, color: DailozColor.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: height / 26,
              ),
              Row(
                children: [
                  Text(
                    "Today_Task".tr,
                    style: hsSemiBold.copyWith(fontSize: 24),
                  ),
                  const Spacer(),
                  Text(
                    "View_all".tr,
                    style: hsRegular.copyWith(
                        fontSize: 12, color: DailozColor.appcolor),
                  ),
                ],
              ),
              SizedBox(
                // height: MediaQuery.of(context).size.height / 0.1,
                child: ValueListenableBuilder<Box<taskModel>>(
                  valueListenable: Boxes.getData().listenable(),
                  builder: (context, box, _) {
                    var data = box.values.toList().cast<taskModel>();

                    var today =
                        DateTime.now().toLocal().toString().split(' ')[0];
                    var tasksForToday = data.where((task) {
                      return task.startdate ==
                          DateTime.now().toLocal().toString().split(' ')[0];
                    }).toList();

                    return ListView.builder(
                      itemCount: tasksForToday.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final task = tasksForToday[index];
                        print(task);
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Get.to(DailozTaskdetail(
                              startTime: task.starttime.toString(),
                              endDate: task.enddate.toString(),
                              tags: task.tags,
                              taskDescription: task.description.toString(),
                              taskType: task.tasktype.toString(),
                              endTime: task.endtime.toString(),
                            ));
                            // Navigator.push(context, MaterialPageRoute(
                            //   builder: (context) {
                            //     return const DailozTaskdetail();
                            //   },
                            // ));
                          },
                          child: CustomDecoratedText(
                            title: task.title.toString(),
                            time: "${task.starttime} - ${task.endtime}",
                            titleColor: DailozColor.black,
                            timeColor: DailozColor.textgray,
                            containerColor: DailozColor.bgpurple,
                            tags: task.tags, // Tags list
                            tagTextColor:
                                DailozColor.purple, // Set the tag text color
                            tagBackgroundColor: const Color(
                                0xffECEAFF), // Set the tag background color
                          ),
                          //  TaskCard(
                          //   title: task.title ??
                          //       'No Title', // Handle nullable title
                          //   startTime: task.starttime ??
                          //       'No Start Time', // Handle nullable start time
                          //   endTime: task.endtime ??
                          //       'No End Time', // Handle nullable end time
                          //   tags: task.tags ?? [], // Handle nullable tags
                          // ),
                        );
                      },
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
