// // import 'package:flutter/material.dart';

// // class CustomDecoratedText extends StatelessWidget {
// //   final String title;
// //   final String time;
// //   final Color titleColor;
// //   final Color timeColor;
// //   final Color containerColor;
// //   final List<String> tags;
// //   final Color tagTextColor; // Color for the tag text
// //   final Color tagBackgroundColor; // Color for the tag background

// //   const CustomDecoratedText({
// //     Key? key,
// //     required this.title,
// //     required this.time,
// //     required this.tags,
// //     this.titleColor = Colors.black,
// //     this.timeColor = Colors.grey,
// //     this.containerColor = Colors.white,
// //     this.tagTextColor = Colors.red,
// //     this.tagBackgroundColor = Colors.orange,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: const EdgeInsets.only(bottom: 10.0),
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(14),
// //         color: containerColor,
// //       ),
// //       child: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               children: [
// //                 Text(
// //                   title,
// //                   style: TextStyle(
// //                     fontSize: 16,
// //                     color: titleColor,
// //                     fontWeight: FontWeight.w600,
// //                   ),
// //                 ),
// //                 const Spacer(),
// //                 Icon(Icons.more_vert, color: titleColor),
// //               ],
// //             ),
// //             const SizedBox(height: 5),
// //             Text(
// //               time,
// //               style: TextStyle(
// //                 fontSize: 14,
// //                 color: timeColor,
// //               ),
// //             ),
// //             const SizedBox(height: 10),
// //             Wrap(
// //               spacing: 5,
// //               children: tags.map((tag) => _buildTag(tag)).toList(),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildTag(String text) {
// //     return Container(
// //       decoration: BoxDecoration(
// //         color: tagBackgroundColor, // Use the passed background color
// //         borderRadius: BorderRadius.circular(5),
// //       ),
// //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
// //       child: Text(
// //         text,
// //         style: TextStyle(
// //           fontSize: 10,
// //           color: tagTextColor, // Use the passed text color
// //           fontWeight: FontWeight.w600,
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// class CustomDecoratedText extends StatelessWidget {
//   final String title;
//   final String time;
//   final Color titleColor;
//   final Color timeColor;
//   final Color containerColor;
//   final List<String> tags;
//   final Color tagTextColor;
//   final Color tagBackgroundColor;

//   const CustomDecoratedText({
//     Key? key,
//     required this.title,
//     required this.time,
//     required this.tags,
//     this.titleColor = Colors.black,
//     this.timeColor = Colors.grey,
//     this.containerColor = Colors.white,
//     this.tagTextColor = Colors.red,
//     this.tagBackgroundColor = Colors.orange,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 10.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(14),
//         color: containerColor,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: titleColor,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const Spacer(),
//                 PopupMenuButton<String>(
//                   icon: Icon(Icons.more_vert, color: titleColor),
//                   onSelected: (String value) {
//                     if (value == 'Edit') {
//                       // Handle edit action
//                       print('Edit selected');
//                     } else if (value == 'Delete') {
//                       // Handle delete action
//                       print('Delete selected');
//                     }
//                   },
//                   itemBuilder: (BuildContext context) {
//                     return ['Edit', 'Delete'].map((String choice) {
//                       return PopupMenuItem<String>(
//                         value: choice,
//                         child: Text(choice),
//                       );
//                     }).toList();
//                   },
//                 ),
//               ],
//             ),
//             const SizedBox(height: 5),
//             Text(
//               time,
//               style: TextStyle(
//                 fontSize: 14,
//                 color: timeColor,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Wrap(
//               spacing: 5,
//               children: tags.map((tag) => _buildTag(tag)).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTag(String text) {
//     return Container(
//       decoration: BoxDecoration(
//         color: tagBackgroundColor,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: 10,
//           color: tagTextColor,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CustomDecoratedText extends StatelessWidget {
  final String title;
  final String time;
  final Color titleColor;
  final Color timeColor;
  final Color containerColor;
  final List<String> tags;
  final Color tagTextColor;
  final Color tagBackgroundColor;
  final VoidCallback onEdit; // Callback for edit action
  final VoidCallback onDelete; // Callback for delete action

  const CustomDecoratedText({
    Key? key,
    required this.title,
    required this.time,
    required this.tags,
    required this.onEdit, // Required parameter for edit callback
    required this.onDelete, // Required parameter for delete callback
    this.titleColor = Colors.black,
    this.timeColor = Colors.grey,
    this.containerColor = Colors.white,
    this.tagTextColor = Colors.red,
    this.tagBackgroundColor = Colors.orange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: containerColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: titleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                PopupMenuButton<String>(
                  icon: Icon(Icons.more_vert, color: titleColor),
                  onSelected: (String value) {
                    if (value == 'Edit') {
                      onEdit(); // Call the edit callback
                    } else if (value == 'Delete') {
                      onDelete(); // Call the delete callback
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return ['Edit', 'Delete'].map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              time,
              style: TextStyle(
                fontSize: 14,
                color: timeColor,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 5,
              children: tags.map((tag) => _buildTag(tag)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      decoration: BoxDecoration(
        color: tagBackgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          color: tagTextColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
