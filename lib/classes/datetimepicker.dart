import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:taskapp_work/Controllers/addtaskController.dart';
// import 'datetime_controller.dart';

class DateTimePickerService {
  Future<bool> editTime(
      BuildContext context, DateTimeController dateTimeController) async {
    DateTime? dateTime = await showOmniDateTimePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1600).subtract(const Duration(days: 3652)),
      lastDate: DateTime.now().add(const Duration(days: 3652)),
      is24HourMode: false,
      isShowSeconds: false,
      minutesInterval: 1,
      secondsInterval: 1,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      constraints: const BoxConstraints(
        maxWidth: 350,
        maxHeight: 650,
      ),
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1.drive(
            Tween(begin: 0, end: 1),
          ),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      selectableDayPredicate: (dateTime) {
        // Disable 25th Feb 2023
        if (dateTime.year == 2023 &&
            dateTime.month == 2 &&
            dateTime.day == 25) {
          return false;
        } else {
          return true;
        }
      },
    );

    if (dateTime != null) {
      // Update the field with the selected dateTime using Getx controller
      dateTimeController.updateDateTime(dateTime);
      return true;
    }
    return false;
  }
}
