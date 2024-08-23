// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _checkFirstRun();
//   }

//   Future<void> _checkFirstRun() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool isFirstRun = prefs.getBool('isFirstRun') ?? true;

//     if (isFirstRun) {
//       _showDialog();
//       prefs.setBool('isFirstRun', false);
//     }
//   }

//   void _showDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Enter your details'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//               ),
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(labelText: 'Email'),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 _saveUserDetails();
//                 Navigator.of(context).pop();
//               },
//               child: Text('Save'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> _saveUserDetails() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('userName', nameController.text);
//     await prefs.setString('userEmail', emailController.text);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('My App'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: _showDialog,
//             child: Text('Edit Profile'),
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MyApp());
// }

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _loadUserDetails();
//   }

//   Future<void> _loadUserDetails() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     nameController.text = prefs.getString('userName') ?? '';
//     emailController.text = prefs.getString('userEmail') ?? '';
//   }

//   Future<void> _saveUserDetails() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('userName', nameController.text);
//     await prefs.setString('userEmail', emailController.text);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _saveUserDetails();
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Profile updated')),
//                 );
//               },
//               child: Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text('My App'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ProfilePage()),
//             );
//           },
//           child: Text('Edit Profile'),
//         ),
//       ),
//     ),
//   );
// }
