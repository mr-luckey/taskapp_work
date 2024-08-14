import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:taskapp_work/models/taskModel.dart';

import 'dailoz/dailoz_page/dailoz_Authentication/dailoz_splashscreen.dart';
import 'dailoz/dailoz_theme/dailoz_theme.dart';
import 'dailoz/dailoz_theme/dailoz_themecontroller.dart';
import 'dailoz/dailoz_translation/stringtranslation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(taskModelAdapter());
  Hive.openBox<taskModel>('task');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final themedata = Get.put(DailozThemecontroler());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themedata.isdark
          ? DailozMythemes.darkTheme
          : DailozMythemes.lightTheme,
      fallbackLocale: const Locale('en', 'US'),
      translations: DailozApptranslation(),
      locale: const Locale('en', 'US'),
      home: const DailozSplashscreen(),
    );
  }
}
