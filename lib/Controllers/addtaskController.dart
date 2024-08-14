import 'package:get/get.dart';

class DateTimeController extends GetxController {
  var selectedDate = ''.obs;
  var selectedTime = ''.obs;

  void updateDateTime(DateTime dateTime) {
    final date =
        "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
    final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
    final period = dateTime.hour >= 12 ? 'PM' : 'AM';
    final time = "$hour:${dateTime.minute.toString().padLeft(2, '0')} $period";

    selectedDate.value = date;
    selectedTime.value = time;
  }
}

// class CheckBoxController extends GetxController {
//   var selectedCheckBox = ''.obs;

//   void updateCheckBox(String value) {
//     selectedCheckBox.value = value;
//   }
// }
// import 'package:get/get.dart';

class CheckBoxController extends GetxController {
  var selectedCheckBox = 0.obs;

  void updateCheckBox(int index) {
    selectedCheckBox.value = index;
    print(selectedCheckBox
        .value); //FIXME: translate index data into string that is index is zero set value of type to 'Personal'and if its 1 then set value of type to 'Work' and if its 2 then set value of type to 'Meeting' and if its 3 then set value of type to 'Study'
    // Save the selected value to the database here
  }
}

class TagController extends GetxController {
  List<String> selectedTags = <String>[].obs;

  void updateTag(String tag) {
    if (selectedTags.contains(tag)) {
      selectedTags.remove(tag);
    } else {
      selectedTags.add(tag);
    }
  }
}
