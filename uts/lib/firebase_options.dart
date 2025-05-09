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
    apiKey: 'AIzaSyCeMMV2xmamKA_oehAJdVV9EgabT-KiwGY',
    appId: '1:125164291018:web:42e8a4623ad2a6ba470533',
    messagingSenderId: '125164291018',
    projectId: 'utsfj-33cff',
    authDomain: 'utsfj-33cff.firebaseapp.com',
    storageBucket: 'utsfj-33cff.firebasestorage.app',
    measurementId: 'G-EDPP07KNG6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCVNIxFNmVfOGAFiDGL6P0j1UARRwE2q9o',
    appId: '1:125164291018:android:307eaaf7ce348286470533',
    messagingSenderId: '125164291018',
    projectId: 'utsfj-33cff',
    storageBucket: 'utsfj-33cff.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAjTxKJiAwd3LUxAax_d7d4bJs31hkppkc',
    appId: '1:125164291018:ios:c1d234699a5569aa470533',
    messagingSenderId: '125164291018',
    projectId: 'utsfj-33cff',
    storageBucket: 'utsfj-33cff.firebasestorage.app',
    iosBundleId: 'com.example.uts',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAjTxKJiAwd3LUxAax_d7d4bJs31hkppkc',
    appId: '1:125164291018:ios:c1d234699a5569aa470533',
    messagingSenderId: '125164291018',
    projectId: 'utsfj-33cff',
    storageBucket: 'utsfj-33cff.firebasestorage.app',
    iosBundleId: 'com.example.uts',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCeMMV2xmamKA_oehAJdVV9EgabT-KiwGY',
    appId: '1:125164291018:web:fd5eeb8ff6138e4f470533',
    messagingSenderId: '125164291018',
    projectId: 'utsfj-33cff',
    authDomain: 'utsfj-33cff.firebaseapp.com',
    storageBucket: 'utsfj-33cff.firebasestorage.app',
    measurementId: 'G-7XGM3S63FJ',
  );
}
