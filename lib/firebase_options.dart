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
    apiKey: 'AIzaSyArswpz1s1elWYsOUbox3Hi6BlT39rqMc0',
    appId: '1:382897237818:web:a7a5c72b84fcf3138b2a03',
    messagingSenderId: '382897237818',
    projectId: 'ratq-app-86dea',
    authDomain: 'ratq-app-86dea.firebaseapp.com',
    storageBucket: 'ratq-app-86dea.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQS9k9YQ6WxEw5sJjiLyNUHd7xpzowEoY',
    appId: '1:382897237818:android:b012dfac67f6c5188b2a03',
    messagingSenderId: '382897237818',
    projectId: 'ratq-app-86dea',
    storageBucket: 'ratq-app-86dea.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCDfj4nt-FEHISIjzYf36_AgbS0c3PqzgE',
    appId: '1:382897237818:ios:530722f858a915c28b2a03',
    messagingSenderId: '382897237818',
    projectId: 'ratq-app-86dea',
    storageBucket: 'ratq-app-86dea.appspot.com',
    iosClientId: '382897237818-0pq1o3t3khcl5k47gbeoq83ahhl7morm.apps.googleusercontent.com',
    iosBundleId: 'com.example.ratqAppp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCDfj4nt-FEHISIjzYf36_AgbS0c3PqzgE',
    appId: '1:382897237818:ios:530722f858a915c28b2a03',
    messagingSenderId: '382897237818',
    projectId: 'ratq-app-86dea',
    storageBucket: 'ratq-app-86dea.appspot.com',
    iosClientId: '382897237818-0pq1o3t3khcl5k47gbeoq83ahhl7morm.apps.googleusercontent.com',
    iosBundleId: 'com.example.ratqAppp',
  );
}
