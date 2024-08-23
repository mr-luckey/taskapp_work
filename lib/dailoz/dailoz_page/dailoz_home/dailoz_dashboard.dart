// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_color.dart';
// import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_icons.dart';
// import 'package:taskapp_work/dailoz/dailoz_page/dailoz_task/dailoz_addtask.dart';

// import '../../dailoz_theme/dailoz_themecontroller.dart';
// import '../dailoz_graphic/dailoz_graphic.dart';
// import '../dailoz_profile/dailoz_profile.dart';
// import '../dailoz_task/dailoz_task.dart';
// import 'dailoz_home.dart';

// // ignore: must_be_immutable
// class DailozDashboard extends StatefulWidget {
//   int? index;
//   DailozDashboard(this.index, {super.key});

//   @override
//   State<DailozDashboard> createState() => _DailozDashboardState();
// }

// class _DailozDashboardState extends State<DailozDashboard> {
//   dynamic size;
//   double height = 0.00;
//   double width = 0.00;
//   int selectindex = 0;
//   late PageController pageController;
//   int _selectedItemIndex = 0;
//   final themedata = Get.put(DailozThemecontroler());
//   final List<Widget> _pages = [
//     Dailozhome(),
//     DailozTask(),
//     MyTestWidget(),
//     // DailozGraphic(),
//     DailozProfile(),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _selectedItemIndex = widget.index ?? 0;
//     pageController = PageController(initialPage: _selectedItemIndex);

//     // init();
//   }

//   // void init() async {}

//   @override
//   void setState(fn) {
//     if (mounted) super.setState(fn);
//   }

//   Widget _bottomTabBar() {
//     return Padding(
//       padding:
//           EdgeInsets.symmetric(horizontal: width / 30, vertical: height / 70),
//       child: Container(
//         decoration: BoxDecoration(
//             color: themedata.isdark ? DailozColor.black : DailozColor.white,
//             borderRadius: BorderRadius.circular(14),
//             boxShadow: const [
//               BoxShadow(color: DailozColor.textgray, blurRadius: 5)
//             ]),
//         child: BottomNavigationBar(
//           currentIndex: _selectedItemIndex,
//           onTap: _onTap,
//           elevation: 0,
//           showSelectedLabels: false,
//           showUnselectedLabels: false,
//           backgroundColor: DailozColor.transparent,
//           type: BottomNavigationBarType.fixed,
//           fixedColor: themedata.isdark ? DailozColor.white : DailozColor.black,
//           items: <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 DailozSvgimage.home,
//                 height: height / 30,
//                 width: width / 30,
//               ),
//               activeIcon: SvgPicture.asset(
//                 DailozSvgimage.homefill,
//                 height: height / 35,
//                 width: width / 35,
//               ),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 DailozSvgimage.task,
//                 height: height / 30,
//                 width: width / 30,
//               ),
//               activeIcon: SvgPicture.asset(
//                 DailozSvgimage.taskfill,
//                 height: height / 30,
//                 width: width / 30,
//               ),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: SvgPicture.asset(DailozSvgimage.graphic,
//                   height: height / 32, width: width / 32),
//               activeIcon: SvgPicture.asset(
//                 DailozSvgimage.graphicfill,
//                 height: height / 34,
//                 width: width / 34,
//               ),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 DailozSvgimage.folder,
//                 height: height / 32,
//                 width: width / 32,
//               ),
//               activeIcon: SvgPicture.asset(
//                 DailozSvgimage.folderfill,
//                 height: height / 32,
//                 width: width / 32,
//               ),
//               label: '',
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _onTap(int index) {
//     setState(() {
//       _selectedItemIndex = index;
//       pageController.jumpToPage(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     size = MediaQuery.of(context).size;
//     height = size.height;
//     width = size.width;
//     return WillPopScope(
//       onWillPop: () async {
//         bool shouldExit = await showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text('Would you like to exit?'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(false),
//                 child: Text('No'),
//               ),
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(true),
//                 child: Text('Yes'),
//               ),
//             ],
//           ),
//         );
//         return shouldExit ?? false;
//       },
//       child: GetBuilder<DailozThemecontroler>(builder: (controller) {
//         return Scaffold(
//           floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               Get.to(DailozAddTask(
//                 check: 2,
//                 headtitle: "New",
//               ));

//               // pageController.jumpToPage(2);
//             },
//             child: const Icon(
//               Icons.add,
//               size: 22,
//               color: DailozColor.white,
//             ),
//             backgroundColor: DailozColor.appcolor,
//           ),
//           bottomNavigationBar: _bottomTabBar(),
//           body: PageView(
//             controller: pageController,
//             onPageChanged: (index) {
//               setState(() {
//                 _selectedItemIndex = index;
//               });
//             },
//             children: _pages,
//           ),
//         );
//       }),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_color.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_icons.dart';
import 'package:taskapp_work/dailoz/dailoz_page/dailoz_task/dailoz_addtask.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../dailoz_theme/dailoz_themecontroller.dart';
import '../dailoz_graphic/dailoz_graphic.dart';
import '../dailoz_profile/dailoz_profile.dart';
import '../dailoz_task/dailoz_task.dart';
import 'dailoz_home.dart';

// ignore: must_be_immutable
class DailozDashboard extends StatefulWidget {
  int? index;
  DailozDashboard(this.index, {super.key});

  @override
  State<DailozDashboard> createState() => _DailozDashboardState();
}

class _DailozDashboardState extends State<DailozDashboard> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  int selectindex = 0;
  late PageController pageController;
  int _selectedItemIndex = 0;
  final themedata = Get.put(DailozThemecontroler());
  final List<Widget> _pages = [
    Dailozhome(),
    DailozTask(),
    MyTestWidget(),
    // DailozGraphic(),
    DailozProfile(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedItemIndex = widget.index ?? 0;
    pageController = PageController(initialPage: _selectedItemIndex);
    _checkAndSetInitialValue();
  }

  Future<void> _checkAndSetInitialValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? false;
    if (!isFirstLaunch) {
      await prefs.setBool('isFirstLaunch', true);
      _showUserDetailsDialog();
    }
  }

  Future<void> _showUserDetailsDialog() async {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter your details'),
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
              onPressed: () async {
                if (nameController.text.isNotEmpty &&
                    emailController.text.isNotEmpty) {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('userName', nameController.text);
                  await prefs.setString('userEmail', emailController.text);
                  Navigator.of(context).pop();
                  _navigateToDashboard();
                }
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToDashboard() {
    pageController.jumpToPage(_selectedItemIndex);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget _bottomTabBar() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width / 30, vertical: height / 70),
      child: Container(
        decoration: BoxDecoration(
            color: themedata.isdark ? DailozColor.black : DailozColor.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(color: DailozColor.textgray, blurRadius: 5)
            ]),
        child: BottomNavigationBar(
          currentIndex: _selectedItemIndex,
          onTap: _onTap,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: DailozColor.transparent,
          type: BottomNavigationBarType.fixed,
          fixedColor: themedata.isdark ? DailozColor.white : DailozColor.black,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                DailozSvgimage.home,
                height: height / 30,
                width: width / 30,
              ),
              activeIcon: SvgPicture.asset(
                DailozSvgimage.homefill,
                height: height / 35,
                width: width / 35,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                DailozSvgimage.task,
                height: height / 30,
                width: width / 30,
              ),
              activeIcon: SvgPicture.asset(
                DailozSvgimage.taskfill,
                height: height / 30,
                width: width / 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(DailozSvgimage.graphic,
                  height: height / 32, width: width / 32),
              activeIcon: SvgPicture.asset(
                DailozSvgimage.graphicfill,
                height: height / 34,
                width: width / 34,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                DailozSvgimage.folder,
                height: height / 32,
                width: width / 32,
              ),
              activeIcon: SvgPicture.asset(
                DailozSvgimage.folderfill,
                height: height / 32,
                width: width / 32,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      _selectedItemIndex = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return WillPopScope(
      onWillPop: () async {
        bool shouldExit = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Would you like to exit?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
        );
        return shouldExit ?? false;
      },
      child: GetBuilder<DailozThemecontroler>(builder: (controller) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(DailozAddTask(
                check: 2,
                headtitle: "New",
              ));

              // pageController.jumpToPage(2);
            },
            child: const Icon(
              Icons.add,
              size: 22,
              color: DailozColor.white,
            ),
            backgroundColor: DailozColor.appcolor,
          ),
          bottomNavigationBar: _bottomTabBar(),
          body: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedItemIndex = index;
              });
            },
            children: _pages,
          ),
        );
      }),
    );
  }
}
