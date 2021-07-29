import 'dart:async';

import 'package:flutter_user/src/firebase/fb_auth.dart';

class AuthBloc {
  var _fbAuth = FBAuth();

  StreamController _nameController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _passController = new StreamController();
  StreamController _phoneController = new StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;
  Stream get phoneStream => _phoneController.stream;

  bool isValid(String name, String email, String pass, String phone) {
    if (name.length == 0) {
      _nameController.sink.addError("Please enter your name");
      return false;
    }
    _nameController.sink.add("");

    if (phone.length == 0) {
      _phoneController.sink.addError("Please enter your phone");
      return false;
    }
    _phoneController.sink.add("");

    if (email.length == 0) {
      _emailController.sink.addError("Please enter your email");
      return false;
    }
    _emailController.sink.add("");

    if (pass.length < 6) {
      _passController.sink
          .addError("Please enter your password and more 6 character");
      return false;
    }
    _passController.sink.add("");

    return true;
  }

  void signUp(String email, String pass, String name, String phone,
      Function onSuccess) {
    _fbAuth.signUp(email, pass, name, phone, onSuccess);
  }

  void signIn(String email, String pass, Function onSuccess) {
    _fbAuth.signIn(email, pass, onSuccess);
  }

  void dispose() {
    _nameController.close();
    _emailController.close();
    _passController.close();
    _phoneController.close();
  }
}
