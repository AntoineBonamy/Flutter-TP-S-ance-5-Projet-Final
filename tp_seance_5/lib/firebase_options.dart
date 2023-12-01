// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCpWVH1P8KMQl42CR44hMqgkhmW3oUu7Dg',
    appId: '1:806970738623:web:a54483e4f55fb2cf98830a',
    messagingSenderId: '806970738623',
    projectId: 'notes-36c38',
    authDomain: 'notes-36c38.firebaseapp.com',
    storageBucket: 'notes-36c38.appspot.com',
    measurementId: 'G-73G22M42LB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDj34YH_onPzn22WPt1NE5UPBLXH6uaqUM',
    appId: '1:806970738623:android:f3d8474d055db08e98830a',
    messagingSenderId: '806970738623',
    projectId: 'notes-36c38',
    storageBucket: 'notes-36c38.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZmshPUquS9U7fYwcAf1MT7N0eaizm84U',
    appId: '1:806970738623:ios:2141f8469016606298830a',
    messagingSenderId: '806970738623',
    projectId: 'notes-36c38',
    storageBucket: 'notes-36c38.appspot.com',
    iosBundleId: 'com.example.tpSeance5',
  );
}