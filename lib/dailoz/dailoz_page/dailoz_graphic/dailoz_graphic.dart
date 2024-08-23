import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multi_circular_slider/multi_circular_slider.dart';
import 'package:taskapp_work/boxes/boxes.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_color.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_icons.dart';
import 'package:taskapp_work/dailoz/dailoz_page/dailoz_home/dailoz_mytask.dart';
import 'package:taskapp_work/models/taskModel.dart';

class MyTestWidget extends StatelessWidget {
  MyTestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.04),
          ValueListenableBuilder(
            valueListenable: Boxes.getData().listenable(),
            builder: (context, Box box, _) {
              var data = box.values.toList().cast<taskModel>();
              var pendingTasks = data
                  .where((task) {
                    return task.tasktype == 'Pending';
                  })
                  .toList()
                  .length;
              var CompletedTasks = data
                  .where((task) {
                    return task.tasktype == "Completed";
                  })
                  .toList()
                  .length;
              var CanceledTasks = data
                  .where((task) {
                    return task.tasktype == 'Canceled';
                  })
                  .toList()
                  .length;

              return Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(DailozMyTask('Pending'));
                      },
                      child: MultiCircularSlider(
                        size: MediaQuery.of(context).size.width * 0.6,
                        progressBarType: MultiCircularSliderType.circular,
                        values: [
                          pendingTasks / 100, // Pending tasks value
                        ],
                        colors: const [
                          DailozColor.appcolor,
                        ],
                        showTotalPercentage: true,
                        label: 'Pending Task',
                        animationDuration: const Duration(milliseconds: 1000),
                        animationCurve: Curves.easeInOut,
                        // innerIcon: Icon(
                        //   Icons.lock_clock_outlined,
                        //   color: Colors.black,
                        // ),
                        trackColor: Colors.white,
                        progressBarWidth: 20.0,
                        trackWidth: 20.0,
                        labelTextStyle: TextStyle(
                          fontSize: 50,
                        ),
                        percentageTextStyle: const TextStyle(fontSize: 30),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(DailozMyTask('Canceled'));
                      },
                      child: MultiCircularSlider(
                        size: MediaQuery.of(context).size.width * 0.6,
                        progressBarType: MultiCircularSliderType.circular,
                        values: [
                          CanceledTasks == 0
                              ? 0.0
                              : CanceledTasks / 100, // Pending tasks value
                        ],
                        colors: const [
                          DailozColor.lightred,
                        ],
                        showTotalPercentage: true,
                        label: 'Cancel Task',
                        animationDuration: const Duration(milliseconds: 1000),
                        animationCurve: Curves.easeInOut,
                        trackColor: Colors.white,
                        progressBarWidth: 20.0,
                        trackWidth: 20.0,
                        labelTextStyle: const TextStyle(fontSize: 30),
                        percentageTextStyle: const TextStyle(fontSize: 30),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(DailozMyTask('Completed'));
                      },
                      child: MultiCircularSlider(
                        size: MediaQuery.of(context).size.width * 0.6,
                        progressBarType: MultiCircularSliderType.circular,
                        values: [
                          CompletedTasks == 0
                              ? 0.0
                              : CompletedTasks / 100, // Pending tasks value
                        ],
                        colors: const [
                          Color(0xFF29D3E8),
                        ],
                        showTotalPercentage: true,
                        label: 'Completed Task',
                        animationDuration: const Duration(milliseconds: 1000),
                        animationCurve: Curves.easeInOut,
                        trackColor: Colors.white,
                        progressBarWidth: 20.0,
                        trackWidth: 20.0,
                        labelTextStyle: TextStyle(fontSize: 30),
                        percentageTextStyle: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
