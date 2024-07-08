import 'package:flutter/material.dart';
//import 'Signup.dart';
//import 'package:task_management_app/libraryScreen.dart';
//import 'package:task_management_app/Login.dart';
//import 'package:task_management_app/Signup.dart';
//import 'Login.dart';
import 'welcomeScreen.dart';
//import 'libraryScreen.dart';
//import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}
