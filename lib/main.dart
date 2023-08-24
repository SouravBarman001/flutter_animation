import 'package:flutter/material.dart';
import 'package:flutter_animation/practice_folder_one/basic_animation.dart';
import 'package:flutter_animation/practice_folder_one/loading_animation.dart';
import 'package:flutter_animation/practice_folder_one/parenting_animation.dart';
import 'package:flutter_animation/practice_folder_one/transform_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingAnimation(),
    );
  }
}

