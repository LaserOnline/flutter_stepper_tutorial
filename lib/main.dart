import 'package:flutter/material.dart';
import './widget/Stepper_01.dart';
import './widget/Stepper_02.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stepper01(),
      debugShowCheckedModeBanner: false,
    );
  }
}
