import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/homepage.dart';
import 'package:tic_tac_toe/Splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //     options: FirebaseOptions(
  //   apiKey: 'AIzaSyD17xI_vWcC-N3P-C2TPx4hknFZD2fWXfo',
  //   appId: '1:876562850199:android:4132000b59e7b8362ee4d2',
  //   messagingSenderId: '876562850199',
  //   projectId: 'todoapp-3cc79',
  //   authDomain: 'todoapp-3cc79.firebaseapp.com',
  // ));
  runApp(
      DevicePreview(enabled: !kReleaseMode, builder: ((context) => MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      }),
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
    //Scaffold(
    //   appBar: AppBar(
    //     title: Text("My App"),
    //     backgroundColor: Colors.blue,
    //   ),
    //   body: SignUp(),
    //   // body: Center(
    //   //   child: ElevatedButton(
    //   //       onPressed: () {
    //   //         signup();
    //   //       },
    //   //       child: Text(
    //   //         "Sign up",
    //   //         style: TextStyle(color: Colors.blue, fontSize: 20),
    //   //       )),
    //   // ),
    // ));
  }
}
