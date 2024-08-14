import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DatetimeController extends GetxController {
  var startTime = ''.obs;
  var endTime = ''.obs;

  Future<void> selectDate(BuildContext context, bool isStartTime) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final DateTime combinedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        if (isStartTime) {
          startTime.value =
              DateFormat('dd-MM-yyyy hh:mm a').format(combinedDateTime);
        } else {
          endTime.value =
              DateFormat('dd-MM-yyyy hh:mm a').format(combinedDateTime);
        }
      }
    }
  }
}
