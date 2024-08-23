import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskapp_work/Controllers/task_controller.dart';
import 'package:taskapp_work/Widgets/cuntom%20cardprofile.dart';
import 'package:taskapp_work/Widgets/tile_card.dart';
import 'package:taskapp_work/boxes/boxes.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_color.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_fontstyle.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_icons.dart';
import 'package:taskapp_work/dailoz/dailoz_page/dailoz_home/dailoz_dashboard.dart';
import 'package:taskapp_work/dailoz/dailoz_page/dailoz_task/Edittask.dart';
import 'package:taskapp_work/dailoz/dailoz_page/dailoz_task/dailoz_task.dart';

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
  ValueNotifier<String> userNameNotifier = ValueNotifier<String>('User');
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
  Future<void> _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString('userName');
    if (userName != null && userName.isNotEmpty) {
      userNameNotifier.value = userName;
    }
  }

  @override
  void initState() {
    taskcc.fetchTasks();
    _loadUserName();
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
                      ValueListenableBuilder<String>(
                        valueListenable: userNameNotifier,
                        builder: (context, value, child) {
                          return Text(
                            "Hi, $value".tr,
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.w600),
                          );
                        },
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
                          Get.offAll(DailozMyTask("Completed"));
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
                                ValueListenableBuilder(
                                  valueListenable: Boxes.getData().listenable(),
                                  builder: (context, Box box, _) {
                                    var data =
                                        box.values.toList().cast<taskModel>();
                                    var officeTasks = data
                                        .where((task) {
                                          return task.tasktype == "Completed";
                                        })
                                        .toList()
                                        .length;
                                    return Text(
                                      "$officeTasks Task",
                                      style: hsMedium.copyWith(
                                        fontSize: 14,
                                        color: DailozColor.black,
                                      ),
                                    );
                                  },
                                )
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
                                ValueListenableBuilder(
                                  valueListenable: Boxes.getData().listenable(),
                                  builder: (context, Box box, _) {
                                    var data =
                                        box.values.toList().cast<taskModel>();
                                    var officeTasks = data
                                        .where((task) {
                                          return task.tasktype == "Canceled";
                                        })
                                        .toList()
                                        .length;
                                    return Text(
                                      "$officeTasks Task",
                                      style: hsMedium.copyWith(
                                        fontSize: 14,
                                        color: DailozColor.black,
                                      ),
                                    );
                                  },
                                )
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
                                ValueListenableBuilder(
                                  valueListenable: Boxes.getData().listenable(),
                                  builder: (context, Box box, _) {
                                    var data =
                                        box.values.toList().cast<taskModel>();
                                    var officeTasks = data
                                        .where((task) {
                                          return task.tasktype == 'Pending';
                                        })
                                        .toList()
                                        .length;
                                    return Text(
                                      "$officeTasks Task",
                                      style: hsMedium.copyWith(
                                        fontSize: 14,
                                        color: DailozColor.black,
                                      ),
                                    );
                                  },
                                )
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
                                ValueListenableBuilder(
                                  valueListenable: Boxes.getData().listenable(),
                                  builder: (context, Box box, _) {
                                    var data =
                                        box.values.toList().cast<taskModel>();
                                    var officeTasks = data
                                        .where((task) {
                                          return task.tasktype == 'On_Going';
                                        })
                                        .toList()
                                        .length;
                                    return Text(
                                      "$officeTasks Task",
                                      style: hsMedium.copyWith(
                                        fontSize: 14,
                                        color: DailozColor.black,
                                      ),
                                    );
                                  },
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
                  TextButton(
                      onPressed: () {
                        print("pressme");
                        Get.offAll(DailozDashboard(1));
                        // Get.toNamed('/dashboard', arguments: 1);
                      },
                      child: Text(
                        "View_all".tr,
                        style: hsRegular.copyWith(
                            fontSize: 12, color: DailozColor.appcolor),
                      )),
                ],
              ),
              SizedBox(
                child: ValueListenableBuilder<Box<taskModel>>(
                  valueListenable: Boxes.getData().listenable(),
                  builder: (context, box, _) {
                    var data = box.values.toList().cast<taskModel>();

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
                              title: task.title.toString(),
                              startTime: task.starttime.toString(),
                              endDate: task.enddate.toString(),
                              tags: task.tags,
                              taskDescription: task.description.toString(),
                              taskType: task.tasktype.toString(),
                              endTime: task.endtime.toString(),
                            ));
                          },
                          child: CustomDecoratedText(
                            onDelete: () {
                              // Delete task
                              task.delete();
                            },
                            onEdit: () {
                              Get.to(DailozEditTask(
                                  headtitle: "", existingTask: task));
                            },
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
