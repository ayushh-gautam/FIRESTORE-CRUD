import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testt/firebase_options.dart';
import 'package:testt/mainPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    home: MainPage(),
  ));
}
