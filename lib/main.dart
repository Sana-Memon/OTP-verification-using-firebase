import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:signing_in_through_otp/firebase_options.dart';
import 'package:signing_in_through_otp/home.dart';
import 'package:signing_in_through_otp/phone.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: MyPhone(),
    );
  }
}
