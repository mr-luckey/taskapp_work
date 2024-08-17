import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_color.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_icons.dart';
import 'package:taskapp_work/dailoz/dailoz_page/dailoz_task/dailoz_addtask.dart';

import '../../dailoz_theme/dailoz_themecontroller.dart';
import '../dailoz_graphic/dailoz_graphic.dart';
import '../dailoz_profile/dailoz_profile.dart';
import '../dailoz_task/dailoz_task.dart';
import 'dailoz_home.dart';

// ignore: must_be_immutable
class DailozDashboard extends StatefulWidget {
  String? index;
  DailozDashboard(this.index, {super.key});

  @override
  State<DailozDashboard> createState() => _DailozDashboardState();
}

class _DailozDashboardState extends State<DailozDashboard> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  int selectindex = 0;
  PageController pageController = PageController();
  int _selectedItemIndex = 0;
  final themedata = Get.put(DailozThemecontroler());
  final List<Widget> _pages = [
    Dailozhome(),
    DailozTask(),
    DailozGraphic(),
    DailozProfile(),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
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
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return GetBuilder<DailozThemecontroler>(builder: (controller) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(DailozAddTask(
              check: 2,
              headtitle: "New",
            ));

            pageController.jumpToPage(2);
          },
          child: const Icon(
            Icons.add,
            size: 22,
            color: DailozColor.white,
          ),
          backgroundColor: DailozColor.appcolor,
        ),
        bottomNavigationBar: _bottomTabBar(),
        body: _pages[_selectedItemIndex],
      );
    });
  }
}
