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
    apiKey: 'AIzaSyCCuCHKRp8UoOku-kdMaDokY12fVyHVkdg',
    appId: '1:228727403766:web:0edde64cebe1f36b6a68d7',
    messagingSenderId: '228727403766',
    projectId: 'd1s-af0ff',
    authDomain: 'd1s-af0ff.firebaseapp.com',
    storageBucket: 'd1s-af0ff.appspot.com',
    measurementId: 'G-K0JEDQP8SC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAQiDWozW4orNy7blDbt8cYKfGy30yt4Hw',
    appId: '1:228727403766:android:67079016025fce766a68d7',
    messagingSenderId: '228727403766',
    projectId: 'd1s-af0ff',
    storageBucket: 'd1s-af0ff.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNBO12UV9VnEtiWW4lj-TEhuESAMs7bKc',
    appId: '1:228727403766:ios:baede33c144cdc156a68d7',
    messagingSenderId: '228727403766',
    projectId: 'd1s-af0ff',
    storageBucket: 'd1s-af0ff.appspot.com',
    iosClientId: '228727403766-0ubeik1ngmuorckribk1jft2e7mi02aq.apps.googleusercontent.com',
    iosBundleId: 'com.example.oneDayOneSomething',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDNBO12UV9VnEtiWW4lj-TEhuESAMs7bKc',
    appId: '1:228727403766:ios:baede33c144cdc156a68d7',
    messagingSenderId: '228727403766',
    projectId: 'd1s-af0ff',
    storageBucket: 'd1s-af0ff.appspot.com',
    iosClientId: '228727403766-0ubeik1ngmuorckribk1jft2e7mi02aq.apps.googleusercontent.com',
    iosBundleId: 'com.example.oneDayOneSomething',
  );
}