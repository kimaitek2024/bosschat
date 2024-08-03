import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBEVuAprdmtLy3GlwGM8Z-1-4gPiRPhVeo",
            authDomain: "f-f-livestream-gemini-zqjt6m.firebaseapp.com",
            projectId: "f-f-livestream-gemini-zqjt6m",
            storageBucket: "f-f-livestream-gemini-zqjt6m.appspot.com",
            messagingSenderId: "894945989078",
            appId: "1:894945989078:web:f52863a159d87e89ffd477"));
  } else {
    await Firebase.initializeApp();
  }
}
