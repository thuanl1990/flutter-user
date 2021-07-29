import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FBAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  DatabaseReference fb_db = FirebaseDatabase.instance.reference();

  List<Object> users = [];

  void signUp(String email, String pass, String name, String phone,
      Function onSuccess) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((users) {
      _createUser(users.user!.uid, name, phone, onSuccess);
      //print(users);
    }).catchError((err) {
      // error msg
      print(err.toString());
    });
  }

  _createUser(String userId, String name, String phone, Function onSuccess) {
    var user = {"name": name, "phone": phone};

    fb_db
        .child('users')
        .child(userId)
        .set(user)
        .then((e) => {onSuccess()})
        .catchError((err) => {print("err: " + err.toString())});
  }

  void signIn(String email, String pass, Function onSuccess) {
    _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      onSuccess();
      getUsers();
    }).catchError((err) {
      //print("err: " + err.toString());
    });
  }

  void getUsers() {
    fb_db.child('users').once().then((DataSnapshot data) {
      Map<dynamic, dynamic> values = data.value;
      // print();
      setState() {
        values.forEach((key, value) {
          users.add({'name': value['name'], 'phone': value['phone']});
        });
      }
    });
  }
}
