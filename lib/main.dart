import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habittrackerapp/signup.dart';

import 'Homepage.dart';
import 'firebase_options.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SingUp(),
    );
  }
}

