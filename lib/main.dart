//Done
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jobquest/chat/ChatPage.dart';
import 'package:jobquest/firebase_options.dart';
import 'package:jobquest/loginscreen.dart';
import 'package:jobquest/welcomescreen.dart';
import 'package:device_preview/device_preview.dart';
// Import Firebase core
// Import firebase_option.dart
// Import splashscreen.dart


void main() async {
 WidgetsFlutterBinding.ensureInitialized();


 // Initialize Firebase
 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );
runApp(DevicePreview(
   builder: (context) => const MyApp(),
 ));
 // runApp(const MyApp());
}


class MyApp extends StatelessWidget {
 const MyApp({super.key});


 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'ASSIGNMENT QUEST',
     theme: ThemeData(),
     home: WelcomeScreen(),
   );
 }
}



