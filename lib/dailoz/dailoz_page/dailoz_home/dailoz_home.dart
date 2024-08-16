import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskapp_work/Controllers/task_controller.dart';
import 'package:taskapp_work/Widgets/tile_card.dart';
import 'package:taskapp_work/boxes/boxes.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_color.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_fontstyle.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_icons.dart';

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

  // var CompletedTasks = Boxes.getData()
  //     .values
  //     .toList()
  //     .cast<taskModel>()
  //     .where((task) => task.tasktype == 'Completed')
  //     .toList();
  // var PendingTasks = Boxes.getData()
  //     .values
  //     .toList()
  //     .cast<taskModel>()
  //     .where((task) => task.tasktype == 'Pending')
  //     .toList();
  // var OngoingTasks = Boxes.getData()
  //     .values
  //     .toList()
  //     .cast<taskModel>()
  //     .where((task) => task.tasktype == 'On_Going')
  //     .toList();
  // var CanceledTasks = Boxes.getData()
  //     .values
  //     .toList()
  //     .cast<taskModel>()
  //     .where((task) => task.tasktype == 'Canceled')
  //     .toList();
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
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return DailozMyTask("Completed");
                            },
                          ));
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
                                Obx(
                                  () => Text(
                                    "${taskcc.completedCount} Task",
                                    style: hsRegular.copyWith(
                                        fontSize: 14, color: DailozColor.black),
                                  ),
                                )
                                // Text(
                                //   "${CompletedTasks.length} Task",
                                //   style: hsRegular.copyWith(
                                //       fontSize: 14, color: DailozColor.black),
                                // ),
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
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return DailozMyTask("Canceled");
                            },
                          ));
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
                                  "${taskcc.cancelCount} Task",
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
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return DailozMyTask("Pending");
                            },
                          ));
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
                                  "${taskcc.pendingCount} Task",
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
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return DailozMyTask("OnGoing");
                            },
                          ));
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
                                  "${taskcc.ongoingCount} Task",
                                  style: hsRegular.copyWith(
                                      fontSize: 14, color: DailozColor.black),
                                ),
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
                height: MediaQuery.of(context).size.height,
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
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const DailozTaskdetail();
                              },
                            ));
                          },
                          child: TaskCard(
                            title: task.title ??
                                'No Title', // Handle nullable title
                            startTime: task.starttime ??
                                'No Start Time', // Handle nullable start time
                            endTime: task.endtime ??
                                'No End Time', // Handle nullable end time
                            tags: task.tags ?? [], // Handle nullable tags
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
