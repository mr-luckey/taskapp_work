import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp_work/Controllers/task_controller.dart';
import 'package:taskapp_work/Widgets/square_Card.dart';
// import 'package:taskapp_work/Widgets/task_card.dart';
import 'package:taskapp_work/Widgets/tile_card.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_color.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_fontstyle.dart';
import 'package:taskapp_work/dailoz/dailoz_page/dailoz_task/dailoz_taskdetail.dart';

class DailozTask extends StatefulWidget {
  @override
  State<DailozTask> createState() => _DailozTaskState();
}

class _DailozTaskState extends State<DailozTask> {
  final DailozTaskController controller = Get.put(DailozTaskController());
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        searchQuery = searchController.text.toLowerCase();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 36),
          child: Column(
            children: [
              SizedBox(height: height / 36),
              TextFormField(
                controller: searchController,
                cursorColor: DailozColor.black,
                style: hsMedium.copyWith(
                    fontSize: 16, color: DailozColor.textgray),
                decoration: InputDecoration(
                  hintText: 'Search for task'.tr,
                  filled: true,
                  fillColor: DailozColor.bggray,
                  prefixIcon: const Icon(Icons.search,
                      size: 22, color: DailozColor.grey),
                  suffixIcon: searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close,
                              size: 22, color: DailozColor.grey),
                          onPressed: () {
                            searchController.clear();
                            setState(() {
                              searchQuery = '';
                            });
                          },
                        )
                      : null,
                  hintStyle: hsMedium.copyWith(
                      fontSize: 16, color: DailozColor.textgray),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: height / 26),
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
              SizedBox(height: height / 26),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 24,
                itemBuilder: (context, hour) {
                  final tasksForHour = controller.tasksForToday.where((task) {
                    final taskHour = int.parse(task.starttime!.split(':')[0]);
                    final matchesSearchQuery =
                        task.title!.toLowerCase().contains(searchQuery);
                    return taskHour == hour &&
                        task.tasktype == 'Pending' &&
                        matchesSearchQuery;
                  }).toList();

                  if (tasksForHour.isEmpty) {
                    return SizedBox.shrink();
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$hour:00',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: tasksForHour.length,
                            itemBuilder: (context, index) {
                              final task = tasksForHour[index];
                              return InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {},
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 5),
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(DailozTaskdetail(
                                          taskType: task.tasktype.toString(),
                                          endDate: task.enddate.toString(),
                                          startTime: task.starttime.toString(),
                                          endTime: task.endtime.toString(),
                                          taskDescription:
                                              task.description.toString(),
                                          tags: task.tags));
                                    },
                                    child: ReusableContainer(
                                      width: 300,
                                      height: 200,
                                      tags: task.tags,
                                      title: task.title.toString(),
                                      time:
                                          '${task.starttime} - ${task.endtime}',
                                      location: task.status.toString(),
                                      type: task.tasktype.toString(),
                                      onMenuItemSelected: (value) {
                                        if (value == 1) {
                                          task.tasktype = 'On_Going';
                                          task.save();
                                          print("working fine and go");
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:easy_date_timeline/easy_date_timeline.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:taskapp_work/Controllers/task_controller.dart';
// import 'package:taskapp_work/Widgets/square_Card.dart';
// // import 'package:taskapp_work/Widgets/task_card.dart';
// import 'package:taskapp_work/Widgets/tile_card.dart';
// import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_color.dart';
// import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_fontstyle.dart';
// import 'package:taskapp_work/dailoz/dailoz_page/dailoz_task/dailoz_taskdetail.dart';

// // import 'dailoz_task_controller.dart';
// class DailozTask extends StatefulWidget {
//   @override
//   State<DailozTask> createState() => _DailozTaskState();
// }

// class _DailozTaskState extends State<DailozTask> {
//   final DailozTaskController controller = Get.put(DailozTaskController());

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var height = size.height;
//     var width = size.width;

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: width / 36, vertical: height / 36),
//           child: Column(
//             children: [
//               SizedBox(height: height / 36),
//               TextFormField(
//                 cursorColor: DailozColor.black,
//                 style: hsMedium.copyWith(
//                     fontSize: 16, color: DailozColor.textgray),
//                 decoration: InputDecoration(
//                   hintText: 'Search for task'.tr,
//                   filled: true,
//                   fillColor: DailozColor.bggray,
//                   prefixIcon: const Icon(Icons.search,
//                       size: 22, color: DailozColor.grey),
//                   suffixIcon: Padding(
//                     padding: const EdgeInsets.all(14),
//                     child: Container(
//                       height: height / 96,
//                       width: height / 96,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: DailozColor.purple,
//                       ),
//                       child: const Icon(Icons.close,
//                           size: 12, color: DailozColor.white),
//                     ),
//                   ),
//                   hintStyle: hsMedium.copyWith(
//                       fontSize: 16, color: DailozColor.textgray),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide.none,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               SizedBox(height: height / 26),
//               EasyDateTimeLine(
//                 initialDate: DateTime.now(),
//                 onDateChange: (selectedDate) {
//                   setState(() {});
//                   controller.updateSelectedDate(selectedDate);
//                 },
//                 activeColor: DailozColor.appcolor,
//                 dayProps: const EasyDayProps(
//                   height: 70,
//                   todayHighlightStyle: TodayHighlightStyle.withBackground,
//                   todayHighlightColor: Colors.transparent,
//                 ),
//               ),
//               SizedBox(height: height / 26),
//               ListView.builder(
//                 shrinkWrap: true, // Add shrinkWrap to ListView.builder
//                 physics:
//                     NeverScrollableScrollPhysics(), // Disable scrolling for the nested ListView
//                 itemCount: 24,
//                 itemBuilder: (context, hour) {
//                   final tasksForHour = controller.tasksForToday.where((task) {
//                     final taskHour = int.parse(task.starttime!.split(':')[0]);
//                     return taskHour == hour && task.tasktype == 'Pending';
//                   }).toList();

//                   // print(tasksForHour.toList().first.description)
//                   if (tasksForHour.isEmpty) {
//                     return SizedBox.shrink();
//                   } else {
//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('$hour:00',
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold)),
//                         SizedBox(
//                           height: 150,
//                           child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: tasksForHour.length,
//                             itemBuilder: (context, index) {
//                               final task = tasksForHour[index];
//                               return InkWell(
//                                 splashColor: Colors.transparent,
//                                 highlightColor: Colors.transparent,
//                                 onTap: () {},
//                                 child: Padding(
//                                   padding:
//                                       const EdgeInsets.only(top: 20, left: 5),
//                                   child: InkWell(
//                                     onTap: () {
//                                       Get.to(DailozTaskdetail(
//                                           taskType: task.tasktype.toString(),
//                                           endDate: task.enddate.toString(),
//                                           startTime: task.starttime.toString(),
//                                           endTime: task.endtime.toString(),
//                                           taskDescription:
//                                               task.description.toString(),
//                                           tags: task.tags));
//                                     },
//                                     child: ReusableContainer(
//                                       width: 300,
//                                       height: 200,
//                                       tags: task.tags,
//                                       title: task.title.toString(),
//                                       time:
//                                           '${task.starttime} - ${task.endtime}',
//                                       // urgency: 'Urgent',
//                                       location: task.status.toString(),
//                                       type: task.tasktype.toString(),
//                                       onMenuItemSelected: (value) {
//                                         if (value == 1) {
//                                           task.tasktype = 'On_Going';
//                                           task.save();
//                                           print("working fine and go");
//                                         }
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     );
//                   }
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// class DailozTask extends StatelessWidget {
//   final DailozTaskController controller = Get.put(DailozTaskController());

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var height = size.height;
//     var width = size.width;

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: width / 36, vertical: height / 36),
//           child: Column(
//             children: [
//               SizedBox(height: height / 36),
//               TextFormField(
//                 cursorColor: DailozColor.black,
//                 style: hsMedium.copyWith(
//                     fontSize: 16, color: DailozColor.textgray),
//                 decoration: InputDecoration(
//                   hintText: 'Search for task'.tr,
//                   filled: true,
//                   fillColor: DailozColor.bggray,
//                   prefixIcon: const Icon(Icons.search,
//                       size: 22, color: DailozColor.grey),
//                   suffixIcon: Padding(
//                     padding: const EdgeInsets.all(14),
//                     child: Container(
//                       height: height / 96,
//                       width: height / 96,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: DailozColor.purple,
//                       ),
//                       child: const Icon(Icons.close,
//                           size: 12, color: DailozColor.white),
//                     ),
//                   ),
//                   hintStyle: hsMedium.copyWith(
//                       fontSize: 16, color: DailozColor.textgray),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide.none,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               SizedBox(height: height / 26),
//               EasyDateTimeLine(
//                 initialDate: DateTime.now(),
//                 onDateChange: (selectedDate) {
//                   controller.updateSelectedDate(selectedDate);
//                 },
//                 activeColor: DailozColor.appcolor,
//                 dayProps: const EasyDayProps(
//                   height: 70,
//                   todayHighlightStyle: TodayHighlightStyle.withBackground,
//                   todayHighlightColor: Colors.transparent,
//                 ),
//               ),
//               Obx(() {
//                 return ListView.builder(
//                   itemCount: 24,
//                   itemBuilder: (context, hour) {
//                     final tasksForHour = controller.tasksForToday.where((task) {
//                       final taskHour = int.parse(task.starttime!.split(':')[0]);
//                       return taskHour == hour;
//                     }).toList();
//                     if (tasksForHour.isEmpty) {
//                       return SizedBox.shrink();
//                     }
//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('$hour:00',
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold)),
//                         SizedBox(
//                           height: 150,
//                           child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: tasksForHour.length,
//                             itemBuilder: (context, index) {
//                               final task = tasksForHour[index];
//                               return InkWell(
//                                 splashColor: Colors.transparent,
//                                 highlightColor: Colors.transparent,
//                                 onTap: () {},
//                                 child: Padding(
//                                   padding:
//                                       const EdgeInsets.only(top: 20, left: 5),
//                                   child: ReusableContainer(
//                                     width: 300,
//                                     height: 200,
//                                     title: task.title.toString(),
//                                     time: '7:90',
//                                     urgency: 'Urgent',
//                                     location: task.status.toString(),
//                                     type: task.tasktype.toString(),
//                                     onMenuItemSelected: (value) {
//                                       if (value == 1) {
//                                         task.tasktype = 'On_Going';
//                                         task.save();
//                                         print("working fine and go");
//                                       }
//                                     },
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




/*Obx(() {
                return SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.tasksForToday.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final task = controller.tasksForToday[index];
                        return InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20, left: 5),
                              child: ReusableContainer(
                                width: 300,
                                height: 200,
                                title: task.title.toString(),
                                time: '7:90',
                                urgency: 'Urgent',
                                location: task.status.toString(),
                                type: task.tasktype.toString(),
                                onMenuItemSelected: (value) {
                                  if (value == 1) {
                                    // var task = pendingTasks[index];
                                    task.tasktype = 'On_Going';
                                    task.save();
                                    print(
                                        "woking fine and go "); //TODO: go to database tasktype update in pending case ongoing can mark completed on going can mark
                                  }
                                },
                              ),
                            ));
                      },
                    ),
                  ),
                );
              }),
           */


              //     SizedBox(
              //       height: height / 36,
              //     ),
              //     SizedBox(
              //       height: height / 8.8,
              //       child: ListView.builder(
              //         itemCount: 31,
              //         scrollDirection: Axis.horizontal,
              //         itemBuilder: (context, index) {
              //           return InkWell(
              //             onTap: () {
              //               setState(() {
              //                 isselected = index;
              //                 selectedDate =
              //                     DateTime.now().add(Duration(days: index));
              //               });
              //             },
              //             child: Container(
              //               width: width / 7,
              //               margin: EdgeInsets.only(bottom: width / 30),
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(12),
              //                   color: isselected == index
              //                       ? DailozColor.appcolor
              //                       : DailozColor.transparent),
              //               child: Padding(
              //                 padding: EdgeInsets.symmetric(vertical: height / 96),
              //                 child: Column(
              //                   children: [
              //                     Text(
              //                       listOfDays[DateTime.now()
              //                                   .add(Duration(days: index))
              //                                   .weekday -
              //                               1]
              //                           .toString(),
              //                       style: hsMedium.copyWith(
              //                           fontSize: 16,
              //                           color: isselected == index
              //                               ? DailozColor.white
              //                               : themedata.isdark
              //                                   ? DailozColor.white
              //                                   : DailozColor.black),
              //                     ),
              //                     SizedBox(
              //                       height: height / 96,
              //                     ),
              //                     Text(
              //                       DateTime.now()
              //                           .add(Duration(days: index))
              //                           .day
              //                           .toString(),
              //                       style: hsRegular.copyWith(
              //                           fontSize: 14,
              //                           color: isselected == index
              //                               ? DailozColor.white
              //                               : themedata.isdark
              //                                   ? DailozColor.white
              //                                   : DailozColor.black),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           );
              //         },
              //       ),
              //     ),
              //     SizedBox(
              //       height: height / 36,
              //     ),
              //     Row(
              //       children: [
              //         Text(
              //           "Today".tr,
              //           style: hsSemiBold.copyWith(fontSize: 24),
              //         ),
              //         const Spacer(),
              //         Text(
              //           "09 h 45 min",
              //           style: hsRegular.copyWith(fontSize: 12),
              //         ),
              //       ],
              //     ),
              //     SizedBox(
              //       height: height / 96,
              //     ),
              //     if (name.isEmpty) ...[
              //       Image.asset(
              //         DailozPngimage.emptytask,
              //         height: height / 4,
              //         fit: BoxFit.fitHeight,
              //       ),
              //       SizedBox(
              //         height: height / 26,
              //       ),
              //       Text(
              //         "You don’t have any schedule today.\nTap the plus button to create new to-do.",
              //         textAlign: TextAlign.center,
              //         style: hsRegular.copyWith(
              //           fontSize: 14,
              //         ),
              //       ),
              //     ] else ...[
              //       const Divider(
              //         color: DailozColor.textgray,
              //       ),
              //       SizedBox(
              //         height: height / 96,
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Padding(
              //             padding: EdgeInsets.only(top: height / 46),
              //             child: Text(
              //               "07:00",
              //               style: hsMedium.copyWith(fontSize: 14),
              //             ),
              //           ),
              //           const Spacer(),
              //           SizedBox(
              //             height: height / 5.7,
              //             width: width / 1.25,
              //             child: ListView.builder(
              //               itemCount: name.length,
              //               scrollDirection: Axis.horizontal,
              //               itemBuilder: (context, index) {
              //                 return Container(
              //                   width: width / 1.8,
              //                   margin: EdgeInsets.only(right: width / 36),
              //                   decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(14),
              //                       color: DailozColor.bggray),
              //                   child: Padding(
              //                     padding: EdgeInsets.symmetric(
              //                         horizontal: width / 36,
              //                         vertical: height / 66),
              //                     child: Column(
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       children: [
              //                         Row(
              //                           children: [
              //                             Text(
              //                               name[index],
              //                               style: hsMedium.copyWith(
              //                                   fontSize: 16,
              //                                   color: DailozColor.black),
              //                             ),
              //                             const Spacer(),
              //                             SizedBox(
              //                               height: height / 22,
              //                               width: height / 26,
              //                               child: PopupMenuButton<int>(
              //                                 itemBuilder: (context) => [
              //                                   PopupMenuItem(
              //                                     value: 1,
              //                                     child: Row(
              //                                       children: [
              //                                         Image.asset(
              //                                           DailozPngimage.closeSquare,
              //                                           height: height / 36,
              //                                           color: DailozColor.black,
              //                                         ),
              //                                         SizedBox(
              //                                           width: width / 36,
              //                                         ),
              //                                         Text(
              //                                           "Disable",
              //                                           style: hsRegular.copyWith(
              //                                               fontSize: 16,
              //                                               color:
              //                                                   DailozColor.black),
              //                                         ),
              //                                       ],
              //                                     ),
              //                                   ),
              //                                   PopupMenuItem(
              //                                     value: 2,
              //                                     child: Row(
              //                                       children: [
              //                                         Image.asset(
              //                                           DailozPngimage.editSquare,
              //                                           height: height / 36,
              //                                         ),
              //                                         SizedBox(
              //                                           width: width / 36,
              //                                         ),
              //                                         Text(
              //                                           "Edit",
              //                                           style: hsRegular.copyWith(
              //                                               fontSize: 16,
              //                                               color:
              //                                                   DailozColor.black),
              //                                         ),
              //                                       ],
              //                                     ),
              //                                   ),
              //                                   PopupMenuItem(
              //                                     value: 3,
              //                                     child: Row(
              //                                       children: [
              //                                         Image.asset(
              //                                           DailozPngimage.delete,
              //                                           height: height / 36,
              //                                         ),
              //                                         SizedBox(
              //                                           width: width / 36,
              //                                         ),
              //                                         Text(
              //                                           "Delete",
              //                                           style: hsRegular.copyWith(
              //                                               fontSize: 16,
              //                                               color:
              //                                                   DailozColor.black),
              //                                         ),
              //                                       ],
              //                                     ),
              //                                   )
              //                                 ],
              //                                 offset: const Offset(5, 50),
              //                                 color: DailozColor.white,
              //                                 constraints: BoxConstraints(
              //                                   maxWidth: width / 2.8,
              //                                 ),
              //                                 shape: RoundedRectangleBorder(
              //                                     borderRadius:
              //                                         BorderRadius.circular(14)),
              //                                 icon: Image.asset(
              //                                   DailozPngimage.dot,
              //                                   height: height / 36,
              //                                   fit: BoxFit.fitHeight,
              //                                 ),
              //                                 elevation: 2,
              //                               ),
              //                             )
              //                           ],
              //                         ),
              //                         SizedBox(
              //                           height: height / 200,
              //                         ),
              //                         Text(
              //                           "07:00 - 07:15",
              //                           style: hsRegular.copyWith(
              //                               fontSize: 14,
              //                               color: DailozColor.textgray),
              //                         ),
              //                         SizedBox(
              //                           height: height / 66,
              //                         ),
              //                         Row(
              //                           children: [
              //                             Container(
              //                                 decoration: BoxDecoration(
              //                                     color: const Color(0x338F99EB),
              //                                     borderRadius:
              //                                         BorderRadius.circular(5)),
              //                                 child: Padding(
              //                                   padding: EdgeInsets.symmetric(
              //                                       horizontal: width / 36,
              //                                       vertical: height / 120),
              //                                   child: Text(
              //                                     "Urgent",
              //                                     style: hsMedium.copyWith(
              //                                         fontSize: 10,
              //                                         color: DailozColor.appcolor),
              //                                   ),
              //                                 )),
              //                             SizedBox(
              //                               width: width / 36,
              //                             ),
              //                             Container(
              //                                 decoration: BoxDecoration(
              //                                     color: const Color(0x338F99EB),
              //                                     borderRadius:
              //                                         BorderRadius.circular(5)),
              //                                 child: Padding(
              //                                   padding: EdgeInsets.symmetric(
              //                                       horizontal: width / 36,
              //                                       vertical: height / 120),
              //                                   child: Text(
              //                                     "Home",
              //                                     style: hsMedium.copyWith(
              //                                         fontSize: 10,
              //                                         color: DailozColor.appcolor),
              //                                   ),
              //                                 )),
              //                           ],
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 );
              //               },
              //             ),
              //           )
              //         ],
              //       ),
              //       SizedBox(
              //         height: height / 80,
              //       ),
              //       const Divider(
              //         color: DailozColor.textgray,
              //       ),
              //       SizedBox(
              //         height: height / 96,
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Padding(
              //             padding: EdgeInsets.only(top: height / 46),
              //             child: Text(
              //               "08:00",
              //               style: hsMedium.copyWith(fontSize: 14),
              //             ),
              //           ),
              //           const Spacer(),
              //           SizedBox(
              //             height: height / 5.7,//TODO:
              //             width: width / 1.25,
              //             child: ListView.builder(
              //               itemCount: 3,
              //               scrollDirection: Axis.horizontal,
              //               itemBuilder: (context, index) {
              //                 return Container(
              //                   width: width / 1.8,
              //                   margin: EdgeInsets.only(right: width / 36),
              //                   decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(14),
              //                       color: DailozColor.bggray),
              //                   child: Padding(
              //                     padding: EdgeInsets.symmetric(
              //                         horizontal: width / 36,
              //                         vertical: height / 66),
              //                     child: Column(
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       children: [
              //                         Row(
              //                           children: [
              //                             Text(
              //                               "Cleaning Clothes",
              //                               style: hsMedium.copyWith(
              //                                   fontSize: 16,
              //                                   color: DailozColor.black),
              //                             ),
              //                             const Spacer(),
              //                             SizedBox(
              //                               height: height / 22,
              //                               width: height / 26,
              //                               child: PopupMenuButton<int>(
              //                                 itemBuilder: (context) => [
              //                                   PopupMenuItem(
              //                                     value: 1,
              //                                     child: Row(
              //                                       children: [
              //                                         Image.asset(
              //                                           DailozPngimage.closeSquare,
              //                                           height: height / 36,
              //                                           color: DailozColor.black,
              //                                         ),
              //                                         SizedBox(
              //                                           width: width / 36,
              //                                         ),
              //                                         Text(
              //                                           "Disable",
              //                                           style: hsRegular.copyWith(
              //                                               fontSize: 16,
              //                                               color:
              //                                                   DailozColor.black),
              //                                         ),
              //                                       ],
              //                                     ),
              //                                   ),
              //                                   PopupMenuItem(
              //                                     value: 2,
              //                                     child: Row(
              //                                       children: [
              //                                         Image.asset(
              //                                           DailozPngimage.editSquare,
              //                                           height: height / 36,
              //                                         ),
              //                                         SizedBox(
              //                                           width: width / 36,
              //                                         ),
              //                                         Text(
              //                                           "Edit",
              //                                           style: hsRegular.copyWith(
              //                                               fontSize: 16,
              //                                               color:
              //                                                   DailozColor.black),
              //                                         ),
              //                                       ],
              //                                     ),
              //                                   ),
              //                                   PopupMenuItem(
              //                                     value: 3,
              //                                     child: Row(
              //                                       children: [
              //                                         Image.asset(
              //                                           DailozPngimage.delete,
              //                                           height: height / 36,
              //                                         ),
              //                                         SizedBox(
              //                                           width: width / 36,
              //                                         ),
              //                                         Text(
              //                                           "Delete",
              //                                           style: hsRegular.copyWith(
              //                                               fontSize: 16,
              //                                               color:
              //                                                   DailozColor.black),
              //                                         ),
              //                                       ],
              //                                     ),
              //                                   )
              //                                 ],
              //                                 offset: const Offset(5, 50),
              //                                 color: DailozColor.white,
              //                                 constraints: BoxConstraints(
              //                                   maxWidth: width / 2.8,
              //                                 ),
              //                                 shape: RoundedRectangleBorder(
              //                                     borderRadius:
              //                                         BorderRadius.circular(14)),
              //                                 icon: Image.asset(
              //                                   DailozPngimage.dot,
              //                                   height: height / 36,
              //                                   fit: BoxFit.fitHeight,
              //                                 ),
              //                                 elevation: 2,
              //                               ),
              //                             )
              //                           ],
              //                         ),
              //                         SizedBox(
              //                           height: height / 200,
              //                         ),
              //                         Text(
              //                           "07:00 - 07:15",
              //                           style: hsRegular.copyWith(
              //                               fontSize: 14,
              //                               color: DailozColor.textgray),
              //                         ),
              //                         SizedBox(
              //                           height: height / 66,
              //                         ),
              //                         Row(
              //                           children: [
              //                             Container(
              //                                 decoration: BoxDecoration(
              //                                     color: const Color(0x338F99EB),
              //                                     borderRadius:
              //                                         BorderRadius.circular(5)),
              //                                 child: Padding(
              //                                   padding: EdgeInsets.symmetric(
              //                                       horizontal: width / 36,
              //                                       vertical: height / 120),
              //                                   child: Text(
              //                                     "Urgent",
              //                                     style: hsMedium.copyWith(
              //                                         fontSize: 10,
              //                                         color: DailozColor.appcolor),
              //                                   ),
              //                                 )),
              //                             SizedBox(
              //                               width: width / 36,
              //                             ),
              //                             Container(
              //                                 decoration: BoxDecoration(
              //                                     color: const Color(0x338F99EB),
              //                                     borderRadius:
              //                                         BorderRadius.circular(5)),
              //                                 child: Padding(
              //                                   padding: EdgeInsets.symmetric(
              //                                       horizontal: width / 36,
              //                                       vertical: height / 120),
              //                                   child: Text(
              //                                     "Home",
              //                                     style: hsMedium.copyWith(
              //                                         fontSize: 10,
              //                                         color: DailozColor.appcolor),
              //                                   ),
              //                                 )),
              //                           ],
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 );
              //               },
              //             ),
              //           )
              //         ],
              //       ),
              //       SizedBox(
              //         height: height / 80,
              //       ),
              //       const Divider(
              //         color: DailozColor.textgray,
              //       ),
              //       SizedBox(
              //         height: height / 96,
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             "09:00",
              //             style: hsMedium.copyWith(fontSize: 14),
              //           ),
              //           // SizedBox(width: width/30,),
              //           Text(
              //             "You don’t have any schedule",
              //             style: hsRegular.copyWith(
              //                 fontSize: 14, color: DailozColor.textgray),
              //           ),
              //           Text(
              //             "or",
              //             style: hsRegular.copyWith(
              //                 fontSize: 14, color: DailozColor.textgray),
              //           ),
              //           InkWell(
              //               splashColor: DailozColor.transparent,
              //               highlightColor: DailozColor.transparent,
              //               onTap: () {
              //                 Navigator.push(context, MaterialPageRoute(
              //                   builder: (context) {
              //                     return const DailozAddTask();
              //                   },
              //                 ));
              //               },
              //               child: Text(
              //                 "+ Add",
              //                 style: hsMedium.copyWith(fontSize: 14),
              //               )),
              //           SizedBox(
              //             width: width / 36,
              //           ),
              //         ],
              //       ),
              //       SizedBox(
              //         height: height / 80,
              //       ),
              //       const Divider(
              //         color: DailozColor.textgray,
              //       ),
              //     ]
              //   ],
              // ),