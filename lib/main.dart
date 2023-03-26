import 'package:bloc_state_management_in_flutter_using/Screens/Sign_in/sign_in_screen.dart';
import 'package:bloc_state_management_in_flutter_using/Screens/welcome/welcom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelComeScreen(),
    );
  }
}
