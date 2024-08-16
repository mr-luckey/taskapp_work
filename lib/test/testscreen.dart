// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:taskapp_work/Controllers/task_controller.dart';

// class HourlyTasksScreen extends StatelessWidget {

 
//   final DailozTaskController controller = Get.put(DailozTaskController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Hourly Tasks'),
//       ),
//       body: ListView.builder(
//         itemCount: controller.tasksForToday.length,
//         itemBuilder: (context, index) {
//           final task = controller.tasksForToday[index];
//           int hour = task.key.elementAt(index);
//           String hourLabel = '${hour.toString().padLeft(2, '0')}:00';

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   hourLabel,
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Container(
//                 height: 100, // Set a fixed height for the horizontal list
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   // itemCount: task?.length ?? 0,
//                   itemBuilder: (context, taskIndex) {
//                     return Card(
//                       margin: EdgeInsets.all(8.0),
//                       child: Container(
//                         width: 100,
//                         alignment: Alignment.center,
//                         child: Text(task[]![taskIndex]),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
