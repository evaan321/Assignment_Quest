// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
   show defaultTargetPlatform, kIsWeb, TargetPlatform;


/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
 static FirebaseOptions get currentPlatform {
   if (kIsWeb) {
     return web;
   }
   switch (defaultTargetPlatform) {
     case TargetPlatform.android:
       return android;
     case TargetPlatform.iOS:
       return ios;
     case TargetPlatform.macOS:
       return macos;
     case TargetPlatform.windows:
       return windows;
     case TargetPlatform.linux:
       throw UnsupportedError(
         'DefaultFirebaseOptions have not been configured for linux - '
         'you can reconfigure this by running the FlutterFire CLI again.',
       );
     default:
       throw UnsupportedError(
         'DefaultFirebaseOptions are not supported for this platform.',
       );
   }
 }


 static const FirebaseOptions web = FirebaseOptions(
   apiKey: 'AIzaSyD2Mw08L10pGyyC3HbhHjhgh0Qj3EB41vQ',
   appId: '1:145086556209:web:eca4f249d9272e42728d10',
   messagingSenderId: '145086556209',
   projectId: 'assignmentquest-46fb7',
   authDomain: 'assignmentquest-46fb7.firebaseapp.com',
   storageBucket: 'assignmentquest-46fb7.firebasestorage.app',
 );


 static const FirebaseOptions android = FirebaseOptions(
   apiKey: 'AIzaSyA_MR0ciwSgl3Tad9qTtDwe-Cc3W5Ux70U',
   appId: '1:145086556209:android:eb78ab81ff98bb30728d10',
   messagingSenderId: '145086556209',
   projectId: 'assignmentquest-46fb7',
   storageBucket: 'assignmentquest-46fb7.firebasestorage.app',
 );


 static const FirebaseOptions ios = FirebaseOptions(
   apiKey: 'AIzaSyCWi5U2U_ESgHx8IMKxxu_K5m4bL1EV9_4',
   appId: '1:145086556209:ios:1ffa3ff51f09b894728d10',
   messagingSenderId: '145086556209',
   projectId: 'assignmentquest-46fb7',
   storageBucket: 'assignmentquest-46fb7.firebasestorage.app',
   iosBundleId: 'com.example.jobquest',
 );


 static const FirebaseOptions macos = FirebaseOptions(
   apiKey: 'AIzaSyCWi5U2U_ESgHx8IMKxxu_K5m4bL1EV9_4',
   appId: '1:145086556209:ios:1ffa3ff51f09b894728d10',
   messagingSenderId: '145086556209',
   projectId: 'assignmentquest-46fb7',
   storageBucket: 'assignmentquest-46fb7.firebasestorage.app',
   iosBundleId: 'com.example.jobquest',
 );


 static const FirebaseOptions windows = FirebaseOptions(
   apiKey: 'AIzaSyD2Mw08L10pGyyC3HbhHjhgh0Qj3EB41vQ',
   appId: '1:145086556209:web:63c2eacbb3374622728d10',
   messagingSenderId: '145086556209',
   projectId: 'assignmentquest-46fb7',
   authDomain: 'assignmentquest-46fb7.firebaseapp.com',
   storageBucket: 'assignmentquest-46fb7.firebasestorage.app',
 );


}

