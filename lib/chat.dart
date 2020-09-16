import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class MyChat extends StatefulWidget {
  @override
  _MyChatState createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  var authc = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RESULTS_CHECK"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () async {
                print("sign off ");
                await authc.signOut();
                Navigator.pushNamed(context, "login");
              }),
        ],
      ),
      body: RaisedButton(
        onPressed: () {
          try {
            var user = authc.currentUser;
            print(user.email);
          } catch (e) {
            print(e);
          }
        },
        child: Text('click to know who r u'),
      ),
    );
  }
}
