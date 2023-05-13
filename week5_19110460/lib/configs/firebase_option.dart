import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOption {

  static FirebaseOptions get currentPlatfom {
    return android;
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrq9AKzb5bsg9o1KLAoaVTrXRhwulePIE',
    appId: '1:518295539544:android:57a436e7159abe3ab41f2d',
    messagingSenderId: '518295539544',
    projectId: 'week5-19110460',
    storageBucket: 'week5-19110460.appspot.com',
  );
}