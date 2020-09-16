import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socialchat/chat.dart';
import 'package:socialchat/home.dart';
import 'package:socialchat/login.dart';
import 'package:socialchat/reg.dart';
import 'package:socialchat/signup.dart';
import 'package:socialchat/teacher.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(MaterialApp(
    initialRoute: "home",
    routes: {
      "home": (context) => MyHome(),
      "reg": (context) => MyReg(),
      "login": (context) => MyLogin(),
      "chat": (context) => MyChat(),
      "teacher": (context) => Teacher(),
      "signup": (context) => SignUp(),
    },
  ));
}
