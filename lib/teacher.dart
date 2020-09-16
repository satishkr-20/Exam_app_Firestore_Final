import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Teacher extends StatefulWidget {
  @override
  _TeacherState createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  var authc = FirebaseAuth.instance;
  String email;
  String password;
  String branch;
  String name;

  @override
  Widget build(BuildContext context) {
    var fsconnect = FirebaseFirestore.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text('TEACHERS'),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(
                    hintText: "Enter Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  branch = value;
                },
                decoration: InputDecoration(
                    hintText: "Enter Branch",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                    hintText: "Enter Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                    hintText: "Enter Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(10),
                elevation: 10,
                child: MaterialButton(
                  minWidth: 200,
                  height: 40,
                  child: Text('SUBMIT'),
                  onPressed: () async {
                    fsconnect.collection("faculty").add({
                      'name': name,
                      'Branch': branch,
                      'email': email,
                      'password': password,
                    });
                    try {
                      var user = await authc.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      print(email);
                      print(password);
                      print(user);

                      if (user.additionalUserInfo.isNewUser == true) {
                        Navigator.pushNamed(context, "chat");
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
