import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskapp_work/boxes/boxes.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_color.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_fontstyle.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_icons.dart';
import 'package:taskapp_work/dailoz/dailoz_page/dailoz_home/dailoz_dashboard.dart';
import 'package:taskapp_work/dailoz/dailoz_page/dailoz_profile/Urgenttasks.dart';
import 'package:taskapp_work/functions/length.dart';
import 'package:taskapp_work/models/taskModel.dart';
import '../../dailoz_theme/dailoz_themecontroller.dart';
import 'dailoz_event.dart';
import 'dailoz_meeting.dart';
import 'dailoz_Office.dart';
import 'dailoz_Home.dart';
import 'dailoz_setting.dart';
import 'dailoz_work.dart';

class DailozProfile extends StatefulWidget {
  const DailozProfile({Key? key}) : super(key: key);

  @override
  State<DailozProfile> createState() => _DailozProfileState();
}

class _DailozProfileState extends State<DailozProfile> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  int isselected = 0;
  final themedata = Get.put(DailozThemecontroler());
  List type = ["Personal", "Private", "Secret"];
  int eventCount = getEventTasksCount(tasks);
  int homeCount = getHomeTasksCount(tasks);
  int meetingCount = getMeetingTasksCount(tasks);
  // int officeCount = getOfficeTasksCount(tasks);
  int workCount = getWorkTasksCount(tasks);
  int urgentCount = getUrgentTasksCount(tasks);
  ValueNotifier<String> userNameNotifier = ValueNotifier<String>('User');
  ValueNotifier<String> userEmailNotifier =
      ValueNotifier<String>('example@gmail.com');
  bool isDependencyChanged = true;
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (isDependencyChanged) {
      print("Testing Didchange");
      isDependencyChanged = false;
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _updateUserData(String name, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    await prefs.setString('userEmail', email);
    userNameNotifier.value = name;
    userEmailNotifier.value = email;
  }

  void _showEditDialog() {
    TextEditingController nameController =
        TextEditingController(text: userNameNotifier.value);
    TextEditingController emailController =
        TextEditingController(text: userEmailNotifier.value);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _updateUserData(nameController.text, emailController.text);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString('userName');
    String? userEmail = prefs.getString('userEmail');
    if (userName != null && userName.isNotEmpty) {
      userNameNotifier.value = userName;
    }
    if (userEmail != null && userEmail.isNotEmpty) {
      userEmailNotifier.value = userEmail;
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return WillPopScope(
      onWillPop: () async {
        Get.off(DailozDashboard(0));
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width / 36, vertical: height / 36),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 80),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: _showEditDialog,
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height / 36,
                    ),
                    Container(
                      height: height / 10,
                      width: height / 10,
                      decoration: BoxDecoration(
                          color: DailozColor.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(color: DailozColor.bggray, blurRadius: 5)
                          ]),
                      child: Image.asset(
                        DailozPngimage.avtar,
                        height: height / 16,
                      ),
                    ),
                    SizedBox(
                      height: height / 56,
                    ),
                    ValueListenableBuilder<String>(
                      valueListenable: userNameNotifier,
                      builder: (context, value, child) {
                        return Text(
                          value.tr,
                          style: hsSemiBold.copyWith(fontSize: 20),
                        );
                      },
                    ),
                    ValueListenableBuilder<String>(
                      valueListenable: userEmailNotifier,
                      builder: (context, value, child) {
                        return Text(
                          value.tr,
                          style: hsRegular.copyWith(fontSize: 14),
                        );
                      },
                    ),
                    SizedBox(
                      height: height / 36,
                    ),
                    Row(
                      children: [
                        InkWell(
                          splashColor: DailozColor.transparent,
                          highlightColor: DailozColor.transparent,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const DailozPersonal();
                              },
                            ));
                          },
                          child: Container(
                            height: height / 4.9,
                            width: width / 2.2,
                            decoration: BoxDecoration(
                                color: DailozColor.bgpurple,
                                borderRadius: BorderRadius.circular(14)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width / 36,
                                  vertical: height / 36),
                              child: Column(
                                children: [
                                  Container(
                                      height: height / 15,
                                      width: height / 15,
                                      decoration: BoxDecoration(
                                          color: DailozColor.purple,
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Image.asset(
                                          DailozPngimage.profile,
                                          height: height / 36,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      )),
                                  SizedBox(
                                    height: height / 56,
                                  ),
                                  Text(
                                    "Office".tr,
                                    style: hsMedium.copyWith(
                                        fontSize: 14, color: DailozColor.black),
                                  ),
                                  ValueListenableBuilder(
                                    valueListenable:
                                        Boxes.getData().listenable(),
                                    builder: (context, Box box, _) {
                                      var data =
                                          box.values.toList().cast<taskModel>();
                                      var officeTasks = data
                                          .where((task) {
                                            return task.tags.contains('Office');
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
                        const Spacer(),
                        InkWell(
                          splashColor: DailozColor.transparent,
                          highlightColor: DailozColor.transparent,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const DailozWork();
                              },
                            ));
                          },
                          child: Container(
                            height: height / 4.9,
                            width: width / 2.2,
                            decoration: BoxDecoration(
                                color: DailozColor.bgsky,
                                borderRadius: BorderRadius.circular(14)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width / 36,
                                  vertical: height / 36),
                              child: Column(
                                children: [
                                  Container(
                                      height: height / 15,
                                      width: height / 15,
                                      decoration: BoxDecoration(
                                          color: DailozColor.lightblue,
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Image.asset(
                                          DailozPngimage.work,
                                          height: height / 36,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      )),
                                  SizedBox(
                                    height: height / 56,
                                  ),
                                  Text(
                                    "Work".tr,
                                    style: hsMedium.copyWith(
                                        fontSize: 14, color: DailozColor.black),
                                  ),
                                  ValueListenableBuilder(
                                    valueListenable:
                                        Boxes.getData().listenable(),
                                    builder: (context, Box box, _) {
                                      var data =
                                          box.values.toList().cast<taskModel>();
                                      var officeTasks = data
                                          .where((task) {
                                            return task.tags.contains('Work');
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
                    SizedBox(
                      height: height / 36,
                    ),
                    Row(
                      children: [
                        InkWell(
                          splashColor: DailozColor.transparent,
                          highlightColor: DailozColor.transparent,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const DailozPrivate();
                              },
                            ));
                          },
                          child: Container(
                            height: height / 4.9,
                            width: width / 2.2,
                            decoration: BoxDecoration(
                                color: DailozColor.bgred,
                                borderRadius: BorderRadius.circular(14)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width / 36,
                                  vertical: height / 36),
                              child: Column(
                                children: [
                                  Container(
                                      height: height / 15,
                                      width: height / 15,
                                      decoration: BoxDecoration(
                                          color: DailozColor.lightred,
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Image.asset(
                                          DailozPngimage.lock,
                                          height: height / 36,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      )),
                                  SizedBox(
                                    height: height / 56,
                                  ),
                                  Text(
                                    "Home".tr,
                                    style: hsMedium.copyWith(
                                        fontSize: 14, color: DailozColor.black),
                                  ),
                                  ValueListenableBuilder(
                                    valueListenable:
                                        Boxes.getData().listenable(),
                                    builder: (context, Box box, _) {
                                      var data =
                                          box.values.toList().cast<taskModel>();
                                      var officeTasks = data
                                          .where((task) {
                                            return task.tags.contains('Home');
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
                        const Spacer(),
                        InkWell(
                          splashColor: DailozColor.transparent,
                          highlightColor: DailozColor.transparent,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const DailozMeeting();
                              },
                            ));
                          },
                          child: Container(
                            height: height / 4.9,
                            width: width / 2.2,
                            decoration: BoxDecoration(
                                //color: DailozColor.bggreen,
                                color: DailozColor.lightgreenbg,
                                borderRadius: BorderRadius.circular(14)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width / 36,
                                  vertical: height / 36),
                              child: Column(
                                children: [
                                  Container(
                                      height: height / 15,
                                      width: height / 15,
                                      decoration: BoxDecoration(
                                          color: DailozColor.lightgreen,
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Image.asset(
                                          DailozPngimage.users,
                                          height: height / 36,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      )),
                                  SizedBox(
                                    height: height / 56,
                                  ),
                                  Text(
                                    "Meeting".tr,
                                    style: hsMedium.copyWith(
                                        fontSize: 14, color: DailozColor.black),
                                  ),
                                  ValueListenableBuilder(
                                    valueListenable:
                                        Boxes.getData().listenable(),
                                    builder: (context, Box box, _) {
                                      var data =
                                          box.values.toList().cast<taskModel>();
                                      var officeTasks = data
                                          .where((task) {
                                            return task.tags
                                                .contains('Meeting');
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
                    SizedBox(
                      height: height / 36,
                    ),
                    Row(
                      children: [
                        InkWell(
                          splashColor: DailozColor.transparent,
                          highlightColor: DailozColor.transparent,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const DailozEvent();
                              },
                            ));
                          },
                          child: Container(
                            height: height / 4.9,
                            width: width / 2.2,
                            decoration: BoxDecoration(
                                color: DailozColor.bgpurple,
                                borderRadius: BorderRadius.circular(14)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width / 36,
                                  vertical: height / 36),
                              child: Column(
                                children: [
                                  Container(
                                      height: height / 15,
                                      width: height / 15,
                                      decoration: BoxDecoration(
                                          color: DailozColor.purple,
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Image.asset(
                                            DailozPngimage.calendar,
                                            height: height / 36,
                                            fit: BoxFit.fitHeight,
                                            color: DailozColor.white),
                                      )),
                                  SizedBox(
                                    height: height / 56,
                                  ),
                                  Text(
                                    "Events".tr,
                                    style: hsMedium.copyWith(
                                        fontSize: 14, color: DailozColor.black),
                                  ),
                                  ValueListenableBuilder(
                                    valueListenable:
                                        Boxes.getData().listenable(),
                                    builder: (context, Box box, _) {
                                      var data =
                                          box.values.toList().cast<taskModel>();
                                      var officeTasks = data
                                          .where((task) {
                                            return task.tags.contains('Event');
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
                        const Spacer(),
                        InkWell(
                          splashColor: DailozColor.transparent,
                          highlightColor: DailozColor.transparent,
                          onTap: () {
                            Get.to(Urgenttasks());
                            // createBoard();
                          },
                          child: Container(
                            height: height / 4.9,
                            width: width / 2.2,
                            decoration: BoxDecoration(
                                color: DailozColor.redbglight,
                                borderRadius: BorderRadius.circular(14)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width / 36,
                                  vertical: height / 36),
                              child: Column(
                                children: [
                                  Container(
                                      height: height / 15,
                                      width: height / 15,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF0A58E),
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Image.asset(
                                          DailozPngimage.plus,
                                          height: height / 36,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      )),
                                  SizedBox(
                                    height: height / 56,
                                  ),
                                  Text(
                                    "Urgent".tr,
                                    style: hsMedium.copyWith(
                                        fontSize: 14, color: DailozColor.black),
                                  ),
                                  ValueListenableBuilder(
                                    valueListenable:
                                        Boxes.getData().listenable(),
                                    builder: (context, Box box, _) {
                                      var data =
                                          box.values.toList().cast<taskModel>();
                                      var officeTasks = data
                                          .where((task) {
                                            return task.tags.contains('Urgent');
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> logout() async {
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
                      Text("Log_Out".tr,
                          style: hsSemiBold.copyWith(fontSize: 22)),
                      SizedBox(
                        height: height / 56,
                      ),
                      Text("Are_you_sure_to_log_out_fromthis_account".tr,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: hsRegular.copyWith(fontSize: 16)),
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
                                "Sure".tr,
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

  Future<bool> createBoard() async {
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
                      Text("Create_Board".tr,
                          style: hsSemiBold.copyWith(fontSize: 22)),
                      SizedBox(
                        height: height / 56,
                      ),
                      Text("Board_Name".tr,
                          style: hsMedium.copyWith(fontSize: 14)),
                      SizedBox(
                        height: height / 96,
                      ),
                      SizedBox(
                        height: height / 14,
                        child: TextFormField(
                            cursorColor: DailozColor.black,
                            style: hsMedium.copyWith(
                                fontSize: 16, color: DailozColor.black),
                            decoration: InputDecoration(
                              hintText: 'Board_Name'.tr,
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
                        height: height / 46,
                      ),
                      Text(
                        "Type".tr,
                        style: hsMedium.copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        height: height / 96,
                      ),
                      SizedBox(
                        height: height / 30,
                        child: ListView.builder(
                          itemCount: type.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: width / 26),
                              child: InkWell(
                                splashColor: DailozColor.transparent,
                                highlightColor: DailozColor.transparent,
                                onTap: () {
                                  setState(() {
                                    isselected = index;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      isselected == index
                                          ? Icons.check_box_sharp
                                          : Icons.check_box_outline_blank,
                                      size: 18,
                                      color: isselected == index
                                          ? DailozColor.appcolor
                                          : DailozColor.textgray,
                                    ),
                                    SizedBox(
                                      width: width / 36,
                                    ),
                                    Text(
                                      type[index],
                                      style: hsRegular.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: height / 30,
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
                                "Create".tr,
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
