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
    apiKey: 'AIzaSyCtr0IaEqv5erknw7gKFEKy5TpdAd9TcOo',
    appId: '1:1024214271978:web:bfa1dbd1349b4caff25493',
    messagingSenderId: '1024214271978',
    projectId: 'todo-d090c',
    authDomain: 'todo-d090c.firebaseapp.com',
    storageBucket: 'todo-d090c.appspot.com',
    measurementId: 'G-H4NBJESJ8M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC39OAxQ5sC_e05Gf1gYL9lKlndkm2_A-Y',
    appId: '1:1024214271978:android:fa1a503b191c802cf25493',
    messagingSenderId: '1024214271978',
    projectId: 'todo-d090c',
    storageBucket: 'todo-d090c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAceOv5vOCznHfpUeLmQP6l4scgdiQIMeE',
    appId: '1:1024214271978:ios:967f07be4fe4603af25493',
    messagingSenderId: '1024214271978',
    projectId: 'todo-d090c',
    storageBucket: 'todo-d090c.appspot.com',
    iosBundleId: 'com.example.toDo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAceOv5vOCznHfpUeLmQP6l4scgdiQIMeE',
    appId: '1:1024214271978:ios:967f07be4fe4603af25493',
    messagingSenderId: '1024214271978',
    projectId: 'todo-d090c',
    storageBucket: 'todo-d090c.appspot.com',
    iosBundleId: 'com.example.toDo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCtr0IaEqv5erknw7gKFEKy5TpdAd9TcOo',
    appId: '1:1024214271978:web:c9c024691fcf1b6bf25493',
    messagingSenderId: '1024214271978',
    projectId: 'todo-d090c',
    authDomain: 'todo-d090c.firebaseapp.com',
    storageBucket: 'todo-d090c.appspot.com',
    measurementId: 'G-70NQ8CXTE8',
  );

}