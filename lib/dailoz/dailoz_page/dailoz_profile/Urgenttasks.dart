// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:taskapp_work/Widgets/cuntom%20cardprofile.dart';
// import 'package:taskapp_work/boxes/boxes.dart';
// import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_color.dart';
// import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_fontstyle.dart';
// import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_icons.dart';
// import 'package:taskapp_work/dailoz/dailoz_page/dailoz_task/dailoz_addtask.dart';
// import 'package:taskapp_work/models/taskModel.dart';
// import '../dailoz_task/dailoz_taskdetail.dart';
// import 'dailoz_addpersonal.dart';

// class Urgenttasks extends StatefulWidget {
//   const Urgenttasks({Key? key}) : super(key: key);

//   @override
//   State<Urgenttasks> createState() => _UrgenttasksState();
// }

// class _UrgenttasksState extends State<Urgenttasks> {
//   dynamic size;
//   double height = 0.00;
//   double width = 0.00;
//   @override
//   Widget build(BuildContext context) {
//     size = MediaQuery.of(context).size;
//     height = size.height;
//     width = size.width;
//     return Scaffold(
//       appBar: AppBar(
//         leading: Padding(
//           padding: const EdgeInsets.all(10),
//           child: InkWell(
//             splashColor: DailozColor.transparent,
//             highlightColor: DailozColor.transparent,
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Container(
//               height: height / 20,
//               width: height / 20,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   color: DailozColor.white,
//                   boxShadow: const [
//                     BoxShadow(color: DailozColor.textgray, blurRadius: 5)
//                   ]),
//               child: Padding(
//                 padding: EdgeInsets.only(left: width / 56),
//                 child: const Icon(
//                   Icons.arrow_back_ios,
//                   size: 18,
//                   color: DailozColor.black,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         title: Text(
//           "Urgent".tr,
//           style: hsSemiBold.copyWith(fontSize: 18),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: width / 36, vertical: height / 36),
//           child: Column(
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
//                       // filter();
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
//               SizedBox(
//                 height: MediaQuery.of(context).size.height,
//                 child: ValueListenableBuilder<Box<taskModel>>(
//                   valueListenable: Boxes.getData().listenable(),
//                   builder: (context, box, _) {
//                     var data = box.values.toList().cast<taskModel>();

//                     var eventstask = data.where((task) {
//                       return task.tags.contains("Urgent");
//                     }).toList();

//                     return ListView.builder(
//                       itemCount: eventstask.length,
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//                         final task = eventstask[index];
//                         print(task);

//                         return InkWell(
//                           splashColor: Colors.transparent,
//                           highlightColor: Colors.transparent,
//                           onTap: () {
//                             Navigator.push(context, MaterialPageRoute(
//                               builder: (context) {
//                                 return DailozTaskdetail(
//                                     taskType: task.tasktype.toString(),
//                                     endDate: task.enddate.toString(),
//                                     startTime: task.starttime.toString(),
//                                     endTime: task.endtime.toString(),
//                                     taskDescription:
//                                         task.description.toString(),
//                                     tags: task.tags);
//                                 ;
//                               },
//                             ));
//                           },
//                           child: CustomDecoratedText(
//                               title: task.title.toString(),
//                               time: "${task.starttime} - ${task.endtime}",
//                               titleColor: DailozColor.black,
//                               timeColor: DailozColor.textgray,
//                               containerColor: DailozColor.bgred,
//                               tags: task.tags, // Tags list
//                               tagTextColor: DailozColor
//                                   .lightred, // Set the tag text color
//                               tagBackgroundColor: DailozColor
//                                   .lightorange // Set the tag background color
//                               ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: DailozColor.appcolor,
//         onPressed: () {
//           Get.to(DailozAddTask(
//             headtitle: "Urgent",
//             check: 1,
//           ));
//         },
//         child: const Icon(
//           Icons.add,
//           size: 22,
//           color: DailozColor.white,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskapp_work/Widgets/cuntom%20cardprofile.dart';
import 'package:taskapp_work/boxes/boxes.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_color.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_fontstyle.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_icons.dart';
import 'package:taskapp_work/dailoz/dailoz_page/dailoz_task/dailoz_addtask.dart';
import 'package:taskapp_work/models/taskModel.dart';
import '../dailoz_task/dailoz_taskdetail.dart';
import 'dailoz_addpersonal.dart';

class Urgenttasks extends StatefulWidget {
  const Urgenttasks({Key? key}) : super(key: key);

  @override
  State<Urgenttasks> createState() => _UrgenttasksState();
}

class _UrgenttasksState extends State<Urgenttasks> {
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
                  BoxShadow(color: DailozColor.textgray, blurRadius: 5),
                ],
              ),
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
          "Urgent".tr,
          style: hsSemiBold.copyWith(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 36),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: width / 1.35,
                    child: TextFormField(
                      controller: searchController,
                      cursorColor: DailozColor.black,
                      style: hsMedium.copyWith(
                          fontSize: 16, color: DailozColor.textgray),
                      decoration: InputDecoration(
                        hintText: 'Search for task'.tr,
                        filled: true,
                        fillColor: DailozColor.bggray,
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 22,
                          color: DailozColor.grey,
                        ),
                        suffixIcon: searchController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  size: 22,
                                  color: DailozColor.grey,
                                ),
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
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    splashColor: DailozColor.transparent,
                    highlightColor: DailozColor.transparent,
                    onTap: () {
                      // filter();
                    },
                    child: Container(
                      height: height / 13,
                      width: height / 13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: DailozColor.bggray,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13),
                        child: Image.asset(
                          DailozPngimage.filter,
                          height: height / 36,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 36),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ValueListenableBuilder<Box<taskModel>>(
                  valueListenable: Boxes.getData().listenable(),
                  builder: (context, box, _) {
                    var data = box.values.toList().cast<taskModel>();

                    // Filter tasks by "Urgent" tag and search query
                    var filteredTasks = data.where((task) {
                      final matchesTag = task.tags.contains('Urgent');
                      final matchesSearchQuery =
                          task.title!.toLowerCase().contains(searchQuery);
                      return matchesTag && matchesSearchQuery;
                    }).toList();

                    return ListView.builder(
                      itemCount: filteredTasks.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final task = filteredTasks[index];

                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return DailozTaskdetail(
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
                            time: "${task.starttime} - ${task.endtime}",
                            titleColor: DailozColor.black,
                            timeColor: DailozColor.textgray,
                            containerColor: DailozColor.bgred,
                            tags: task.tags,
                            tagTextColor: DailozColor.lightred,
                            tagBackgroundColor: DailozColor.lightorange,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: DailozColor.appcolor,
        onPressed: () {
          Get.to(DailozAddTask(
            headtitle: "Urgent",
            check: 1,
          ));
        },
        child: const Icon(
          Icons.add,
          size: 22,
          color: DailozColor.white,
        ),
      ),
    );
  }
}
