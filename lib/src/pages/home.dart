import 'package:flutter/material.dart';
import 'package:flutter_user/src/firebase/fb_auth.dart';
//import 'package:flutter_user/src/data/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _fbAuth = FBAuth();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('HOME'),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  'List all user',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                _fbAuth.users.toString(),
                style: const TextStyle(fontSize: 30, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
