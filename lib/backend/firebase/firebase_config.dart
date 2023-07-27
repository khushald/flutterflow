import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDDKPNN7afPAOY25DasfOk5n5-u2zL0q1w",
            authDomain: "social-media-6e09e.firebaseapp.com",
            projectId: "social-media-6e09e",
            storageBucket: "social-media-6e09e.appspot.com",
            messagingSenderId: "705115515009",
            appId: "1:705115515009:web:b884e753d5c788bffc0580",
            measurementId: "G-0DPCL7CSH2"));
  } else {
    await Firebase.initializeApp();
  }
}
