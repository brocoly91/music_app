import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:music_app/src/app.dart';
import 'package:music_app/src/controller/navigator_controller.dart';
import 'package:music_app/src/pages/home/home_detail.dart';
import 'package:music_app/src/pages/home/interview_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('musicBox');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: BindingsBuilder(() { 
        Get.put(NavigatorController());
      }),
      theme: ThemeData(
        backgroundColor: Colors.black,
        // primaryColor: Colors.black,
        primarySwatch: Colors.blue,
      ),
      home: App(),
      getPages: [
        GetPage(name: '/detailInterview', page: () => HomeDetail()),
        GetPage(name: '/interviewInfo', page: () => InterViewInfo()),
      ],
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


