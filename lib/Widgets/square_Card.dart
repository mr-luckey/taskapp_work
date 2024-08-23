// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_color.dart';
// // import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_fontstyle.dart';
// // import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_icons.dart';

// // class ReusableContainer extends StatelessWidget {
// //   final double width;
// //   final double height;
// //   final String title;
// //   final String time;
// //   final String urgency;
// //   final String location;
// //   final String type;
// //   final Function(int) onMenuItemSelected;

// //   const ReusableContainer({
// //     Key? key,
// //     required this.width,
// //     required this.height,
// //     required this.title,
// //     required this.time,
// //     required this.urgency,
// //     required this.location,
// //     required this.type,
// //     required this.onMenuItemSelected,
// //   }) : super(key: key);

// //   Color _getContainerColor() {
// //     switch (type) {
// //       case "Completed":
// //         return DailozColor.bgsky;
// //       case "Canceled":
// //         return DailozColor.bgred;
// //       case "Pending":
// //         return DailozColor.bgpurple;
// //       default:
// //         return DailozColor.bggreen;
// //     }
// //   }

// //   Color _getLocationColor() {
// //     switch (type) {
// //       case "Completed":
// //         return DailozColor.sky;
// //       case "Canceled":
// //         return DailozColor.lightorange;
// //       case "Pending":
// //         return DailozColor.lightpurple;
// //       default:
// //         return DailozColor.parrot;
// //     }
// //   }

// //   Color _getLocationTextColor() {
// //     switch (type) {
// //       case "Completed":
// //         return DailozColor.textblue;
// //       case "Canceled":
// //         return DailozColor.lightred;
// //       case "Pending":
// //         return DailozColor.purple;
// //       default:
// //         return DailozColor.lightgreen;
// //     }
// //   }

// //   List<PopupMenuItem<int>> _buildMenuItems() {
// //     switch (type) {
// //       case "Completed":
// //         return [
// //           _buildMenuItem(1, DailozPngimage.upload, "On_Going"),
// //           // _buildMenuItem(2, DailozPngimage.delete, "Delete"),
// //         ];
// //       case "Canceled":
// //         return [
// //           // _buildMenuItem(1, DailozPngimage.editSquare, "Edit"),
// //           _buildMenuItem(1, DailozPngimage.upload, "On_going"),
// //           // _buildMenuItem(3, DailozPngimage.delete, "Delete"),
// //         ];
// //       case "Pending":
// //         return [
// //           _buildMenuItem(1, DailozPngimage.tickSquare, "Completed"),

// //           _buildMenuItem(2, DailozPngimage.upload, "On_going"),
// //           _buildMenuItem(3, DailozPngimage.delete, "Cancel"),
// //           _buildMenuItem(4, DailozPngimage.editSquare, "Edit"),
// //           // _buildMenuItem(4, DailozPngimage.Complete, "Completed")
// //         ];
// //       default:
// //         return [
// //           _buildMenuItem(1, DailozPngimage.tickSquare, "Completed"),
// //           _buildMenuItem(2, DailozPngimage.editSquare, "Pending"),
// //           _buildMenuItem(3, DailozPngimage.delete, "Cancel"),
// //         ];
// //     }
// //   }

// //   PopupMenuItem<int> _buildMenuItem(
// //     int value,
// //     var icon,
// //     String text,
// //   ) {
// //     return PopupMenuItem(
// //       value: value,
// //       child: Row(
// //         children: [
// //           Image.asset(
// //             icon,
// //             height: height / 36,
// //           ),
// //           SizedBox(
// //             width: width / 36,
// //           ),
// //           Text(
// //             text,
// //             style: hsRegular.copyWith(fontSize: 16, color: DailozColor.black),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// // //TODO: Add and end time in container
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: width / 1.8,
// //       margin: EdgeInsets.only(right: width / 36),
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(14),
// //         color: _getContainerColor(),
// //       ),
// //       child: Padding(
// //         padding:
// //             EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 80),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               children: [
// //                 Text(
// //                   title,
// //                   style:
// //                       hsMedium.copyWith(fontSize: 16, color: DailozColor.black),
// //                 ),
// //                 const Spacer(),
// //                 SizedBox(
// //                   height: height / 22,
// //                   width: height / 26,
// //                   child: PopupMenuButton<int>(
// //                     itemBuilder: (context) => _buildMenuItems(),
// //                     offset: const Offset(5, 50),
// //                     color: DailozColor.white,
// //                     constraints: BoxConstraints(
// //                       maxWidth: width / 2.8,
// //                     ),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(14),
// //                     ),
// //                     icon: Image.asset(
// //                       DailozPngimage.dot,
// //                       height: height / 36,
// //                       fit: BoxFit.fitHeight,
// //                     ),
// //                     elevation: 2,
// //                     onSelected: onMenuItemSelected,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             Text(
// //               time,
// //               style: hsRegular.copyWith(
// //                   fontSize: 14, color: DailozColor.textappcolor),
// //             ),
// //             SizedBox(
// //               height: height / 46,
// //             ),
// //             Row(
// //               children: [
// //                 Container(
// //                   decoration: BoxDecoration(
// //                     color: const Color(0xffFFE9ED),
// //                     borderRadius: BorderRadius.circular(5),
// //                   ),
// //                   child: Padding(
// //                     padding: EdgeInsets.symmetric(
// //                         horizontal: width / 36, vertical: height / 120),
// //                     child: Text(
// //                       urgency,
// //                       style: hsMedium.copyWith(
// //                           fontSize: 10, color: DailozColor.lightred),
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(
// //                   width: width / 36,
// //                 ),
// //                 Container(
// //                   decoration: BoxDecoration(
// //                     color: _getLocationColor(),
// //                     borderRadius: BorderRadius.circular(5),
// //                   ),
// //                   child: Padding(
// //                     padding: EdgeInsets.symmetric(
// //                         horizontal: width / 36, vertical: height / 120),
// //                     child: Text(
// //                       location,
// //                       style: hsMedium.copyWith(
// //                           fontSize: 10, color: _getLocationTextColor()),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_color.dart';
// import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_fontstyle.dart';
// import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_icons.dart';

// class ReusableContainer extends StatelessWidget {
//   final double width;
//   final double height;
//   final String title;
//   final String time;
//   final List<String> tags; // Updated to accept a list of tags
//   final String location;
//   final String type;
//   final Function(int) onMenuItemSelected;

//   const ReusableContainer({
//     Key? key,
//     required this.width,
//     required this.height,
//     required this.title,
//     required this.time,
//     required this.tags, // Updated parameter
//     required this.location,
//     required this.type,
//     required this.onMenuItemSelected,
//   }) : super(key: key);

//   Color _getContainerColor() {
//     switch (type) {
//       case "Completed":
//         return DailozColor.bgsky;
//       case "Canceled":
//         return DailozColor.bgred;
//       case "Pending":
//         return DailozColor.bgpurple;
//       default:
//         return DailozColor.bggreen;
//     }
//   }

//   Color _getLocationColor() {
//     switch (type) {
//       case "Completed":
//         return DailozColor.sky;
//       case "Canceled":
//         return DailozColor.lightorange;
//       case "Pending":
//         return DailozColor.lightpurple;
//       default:
//         return DailozColor.parrot;
//     }
//   }

//   Color _getLocationTextColor() {
//     switch (type) {
//       case "Completed":
//         return DailozColor.textblue;
//       case "Canceled":
//         return DailozColor.lightred;
//       case "Pending":
//         return DailozColor.purple;
//       default:
//         return DailozColor.lightgreen;
//     }
//   }

//   List<PopupMenuItem<int>> _buildMenuItems() {
//     switch (type) {
//       case "Completed":
//         return [
//           _buildMenuItem(1, DailozPngimage.upload, "On_Going"),
//         ];
//       case "Canceled":
//         return [
//           _buildMenuItem(1, DailozPngimage.upload, "On_going"),
//         ];
//       case "Pending":
//         return [
//           _buildMenuItem(1, DailozPngimage.tickSquare, "Completed"),
//           _buildMenuItem(2, DailozPngimage.upload, "On_going"),
//           _buildMenuItem(3, DailozPngimage.delete, "Cancel"),
//           _buildMenuItem(4, DailozPngimage.editSquare, "Edit"),
//         ];
//       default:
//         return [
//           _buildMenuItem(1, DailozPngimage.tickSquare, "Completed"),
//           _buildMenuItem(2, DailozPngimage.editSquare, "Pending"),
//           _buildMenuItem(3, DailozPngimage.delete, "Cancel"),
//         ];
//     }
//   }

//   PopupMenuItem<int> _buildMenuItem(
//     int value,
//     var icon,
//     String text,
//   ) {
//     return PopupMenuItem(
//       value: value,
//       child: Row(
//         children: [
//           Image.asset(
//             icon,
//             height: height / 36,
//           ),
//           SizedBox(
//             width: width / 36,
//           ),
//           Text(
//             text,
//             style: hsRegular.copyWith(fontSize: 16, color: DailozColor.black),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width / 1.8,
//       margin: EdgeInsets.only(right: width / 36),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(14),
//         color: _getContainerColor(),
//       ),
//       child: Padding(
//         padding:
//             EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 80),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Text(
//                   title,
//                   style:
//                       hsMedium.copyWith(fontSize: 16, color: DailozColor.black),
//                 ),
//                 const Spacer(),
//                 SizedBox(
//                   height: height / 22,
//                   width: height / 26,
//                   child: PopupMenuButton<int>(
//                     itemBuilder: (context) => _buildMenuItems(),
//                     offset: const Offset(5, 50),
//                     color: DailozColor.white,
//                     constraints: BoxConstraints(
//                       maxWidth: width / 2.8,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(14),
//                     ),
//                     icon: Image.asset(
//                       DailozPngimage.dot,
//                       height: height / 36,
//                       fit: BoxFit.fitHeight,
//                     ),
//                     elevation: 2,
//                     onSelected: onMenuItemSelected,
//                   ),
//                 ),
//               ],
//             ),
//             Text(
//               time,
//               style: hsRegular.copyWith(
//                   fontSize: 14, color: DailozColor.textappcolor),
//             ),
//             SizedBox(
//               height: height / 46,
//             ),
//             // Replaced urgency with tags
//             Wrap(
//               spacing: width / 36, // Space between tags
//               runSpacing: height / 80, // Space between rows of tags
//               children: tags.map((tag) {
//                 return Container(
//                   decoration: BoxDecoration(
//                     color: const Color(0xffFFE9ED), // Tag background color
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: width / 36, vertical: height / 120),
//                     child: Text(
//                       tag,
//                       style: hsMedium.copyWith(
//                           fontSize: 10,
//                           color: DailozColor.lightred), // Tag text color
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),
//             SizedBox(
//               height: height / 46,
//             ),
//             Row(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     color: _getLocationColor(),
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: width / 36, vertical: height / 120),
//                     child: Text(
//                       location,
//                       style: hsMedium.copyWith(
//                           fontSize: 10, color: _getLocationTextColor()),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_color.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_fontstyle.dart';
import 'package:taskapp_work/dailoz/dailoz_gloabelclass/dailoz_icons.dart';

class ReusableContainer extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final String time;
  final List<String> tags; // Updated to accept a list of tags
  final String location;
  final String type;
  final Function(int) onMenuItemSelected;

  const ReusableContainer({
    Key? key,
    required this.width,
    required this.height,
    required this.title,
    required this.time,
    required this.tags, // Updated parameter
    required this.location,
    required this.type,
    required this.onMenuItemSelected,
  }) : super(key: key);

  Color _getContainerColor() {
    switch (type) {
      case "Completed":
        return DailozColor.bgsky;
      case "Canceled":
        return DailozColor.bgred;
      case "Pending":
        return DailozColor.bgpurple;
      default:
        return DailozColor.bggreen;
    }
  }

  Color _getLocationColor() {
    switch (type) {
      case "Completed":
        return DailozColor.sky;
      case "Canceled":
        return DailozColor.lightorange;
      case "Pending":
        return DailozColor.lightpurple;
      default:
        return DailozColor.parrot;
    }
  }

  Color _getLocationTextColor() {
    switch (type) {
      case "Completed":
        return DailozColor.textblue;
      case "Canceled":
        return DailozColor.lightred;
      case "Pending":
        return DailozColor.purple;
      default:
        return DailozColor.lightgreen;
    }
  }

  List<PopupMenuItem<int>> _buildMenuItems() {
    switch (type) {
      case "Completed":
        return [
          _buildMenuItem(1, DailozPngimage.upload, "On_Going"),
          _buildMenuItem(2, DailozPngimage.editSquare, "Edit"),
          _buildMenuItem(3, DailozPngimage.delete, "Delete"),
        ];
      case "Canceled":
        return [
          _buildMenuItem(1, DailozPngimage.upload, "On_going"),
          _buildMenuItem(2, DailozPngimage.delete, "Delete"),
        ];
      case "Pending":
        return [
          _buildMenuItem(1, DailozPngimage.tickSquare, "Completed"),
          _buildMenuItem(2, DailozPngimage.upload, "On_going"),
          _buildMenuItem(3, DailozPngimage.cloase, "Cancel"),
          _buildMenuItem(4, DailozPngimage.editSquare, "Edit"),
          _buildMenuItem(5, DailozPngimage.delete, "Delete"),
        ];
      default:
        return [
          _buildMenuItem(1, DailozPngimage.tickSquare, "Completed"),
          _buildMenuItem(2, DailozPngimage.editSquare, "Pending"),
          _buildMenuItem(3, DailozPngimage.cloase, "Cancel"),
          _buildMenuItem(4, DailozPngimage.delete, "Delete"),
        ];
    }
  }

  PopupMenuItem<int> _buildMenuItem(
    int value,
    var icon,
    String text,
  ) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Image.asset(
            icon,
            height: height / 36,
          ),
          SizedBox(
            width: width / 40,
          ),
          Text(
            text,
            style: hsRegular.copyWith(fontSize: 14, color: DailozColor.black),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(.0),
      child: Container(
        width: width / 1.8,
        margin: EdgeInsets.only(right: width / 36),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: _getContainerColor(),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 4,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: DailozColor.black,
                      ),
                      overflow: TextOverflow
                          .ellipsis, // Ensures the text is truncated with ellipsis
                      maxLines: 1, // Limit title to a single line
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: height / 22,
                    width: height / 26,
                    child: PopupMenuButton<int>(
                      itemBuilder: (context) => _buildMenuItems(),
                      offset: const Offset(5, 50),
                      color: DailozColor.white,
                      constraints: BoxConstraints(
                        maxWidth: width / 2.8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      icon: Image.asset(
                        DailozPngimage.dot,
                        height: height / 36,
                        fit: BoxFit.fitHeight,
                      ),
                      elevation: 2,
                      onSelected: onMenuItemSelected,
                    ),
                  ),
                ],
              ),
              Text(
                time,
                style: hsRegular.copyWith(
                    fontSize: 14, color: DailozColor.textappcolor),
              ),
              SizedBox(
                height: height / 46,
              ),
              // Display only the first two tags
              Wrap(
                spacing: width / 36, // Space between tags
                runSpacing: height / 80, // Space between rows of tags
                children: tags.take(2).map((tag) {
                  // Take only the first two tags
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffFFE9ED), // Tag background color
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width / 36, vertical: height / 120),
                      child: Text(
                        tag,
                        style: hsMedium.copyWith(
                            fontSize: 10,
                            color: DailozColor.lightred), // Tag text color
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: height / 46,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: _getLocationColor(),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width / 36, vertical: height / 120),
                      child: Text(
                        location,
                        style: hsMedium.copyWith(
                            fontSize: 10, color: _getLocationTextColor()),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
