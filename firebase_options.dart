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
        return macos;
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
    apiKey: 'AIzaSyD_TrituBtE2OihArDQaGGfOkb7B04ntZ4',
    appId: '1:84247149266:web:65b59d5708bc6f06ce4b0b',
    messagingSenderId: '84247149266',
    projectId: 'trusty-anchor-361104',
    authDomain: 'trusty-anchor-361104.firebaseapp.com',
    databaseURL: 'https://trusty-anchor-361104-default-rtdb.firebaseio.com',
    storageBucket: 'trusty-anchor-361104.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBhw7MgiC4lJaYD2TDm-noMRHg5sbAm4nw',
    appId: '1:84247149266:android:1afe4f3119023b4fce4b0b',
    messagingSenderId: '84247149266',
    projectId: 'trusty-anchor-361104',
    databaseURL: 'https://trusty-anchor-361104-default-rtdb.firebaseio.com',
    storageBucket: 'trusty-anchor-361104.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDBveDbVWN4lMUhx9KfVv1mOL4cQU61yy4',
    appId: '1:84247149266:ios:00b269544d7223f4ce4b0b',
    messagingSenderId: '84247149266',
    projectId: 'trusty-anchor-361104',
    databaseURL: 'https://trusty-anchor-361104-default-rtdb.firebaseio.com',
    storageBucket: 'trusty-anchor-361104.appspot.com',
    iosClientId: '84247149266-j7legsbquhnj716qgq21kbmk5mjkmoat.apps.googleusercontent.com',
    iosBundleId: 'com.example.classico',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDBveDbVWN4lMUhx9KfVv1mOL4cQU61yy4',
    appId: '1:84247149266:ios:ac114504214aa5fdce4b0b',
    messagingSenderId: '84247149266',
    projectId: 'trusty-anchor-361104',
    databaseURL: 'https://trusty-anchor-361104-default-rtdb.firebaseio.com',
    storageBucket: 'trusty-anchor-361104.appspot.com',
    iosClientId: '84247149266-94n10ufpbla7i4s5v5sqr30h63guqib3.apps.googleusercontent.com',
    iosBundleId: 'com.example.classico.RunnerTests',
  );
}
