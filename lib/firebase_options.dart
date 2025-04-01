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
    apiKey: 'AIzaSyD0-jbts49yZ8ViaxKBDfGAo6QhXtbnTL0',
    appId: '1:621933923785:android:1ed4a9e455e00d3b6e6c18',
    messagingSenderId: '621933923785',
    projectId: 'helio-84742',
    storageBucket: 'helio-84742.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDriJophHe3m-6JmIUgNK5GKNQfOoExOsE',
    appId: '1:621933923785:ios:06b3e3ae722c9e376e6c18',
    messagingSenderId: '621933923785',
    projectId: 'helio-84742',
    storageBucket: 'helio-84742.firebasestorage.app',
    androidClientId: '621933923785-nq6ieqo6ldmj3taa8vsqi3erdvjmapvd.apps.googleusercontent.com',
    iosClientId: '621933923785-1ch32ieb42nm67u2ftpln4okvarpviao.apps.googleusercontent.com',
    iosBundleId: 'com.example.newMyPharmacist',
  );
}
