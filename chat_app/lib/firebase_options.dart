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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD7VgN1c6RsjGp_uk-nhjoL4ksB8pSKC_A',
    appId: '1:251168102025:android:42ba3209ef49d010481858',
    messagingSenderId: '251168102025',
    projectId: 'flutter-prep-1a354',
    databaseURL: 'https://flutter-prep-1a354-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-prep-1a354.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAKg4XJV6exSGPGPUUrgBwd079Pg2jITC8',
    appId: '1:251168102025:ios:7edc022ccd4f6731481858',
    messagingSenderId: '251168102025',
    projectId: 'flutter-prep-1a354',
    databaseURL: 'https://flutter-prep-1a354-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-prep-1a354.appspot.com',
    iosClientId: '251168102025-baqfkpltbaj3lt9v3fog1o2jl9r55fqb.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}
