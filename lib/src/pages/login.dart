import "package:flutter/material.dart";
import 'package:flutter/gestures.dart';
import 'package:flutter_user/src/blocs/auth_bloc.dart';
import 'package:flutter_user/src/pages/forgotpassword.dart';
import 'package:flutter_user/src/pages/home.dart';
import 'package:flutter_user/src/pages/signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _isShow = false;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  String show = 'show';
  String hide = 'hide';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: const BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Container(
                    width: 70,
                    height: 70,
                    padding: EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffd8d8d8),
                    ),
                    child: FlutterLogo()),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Text(
                  "Hello\nWellcome back",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: TextField(
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  controller: _emailController,
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      //errorText: _userNameValid ? null : _userNameErr,
                      labelStyle:
                          const TextStyle(color: Color(0xff888888), fontSize: 15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    TextField(
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                      obscureText: !_isShow,
                      controller: _passController,
                      decoration: const InputDecoration(
                          labelText: 'Password',
                          //errorText: _PasswordValid ? null : _passwordErr,
                          labelStyle: TextStyle(
                              color: Color(0xff888888), fontSize: 15)),
                    ),
                    GestureDetector(
                      onTap: showPassword,
                      child: Text(
                        _isShow ? hide : show ,
                        style: const TextStyle(fontSize: 13, color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: RaisedButton(
                    onPressed: onSignIn,
                    color: Colors.blue,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: const Text(
                      "Sign in",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: onSignup,
                        child: const Text(
                          "New user sign up",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff888888),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: forgotPass,
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(fontSize: 15, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showPassword() {
    setState(() {
      _isShow = !_isShow;
    });
  }

  void onSignIn() {
    String email = _emailController.text;
    String pass = _passController.text;
    AuthBloc authBloc = AuthBloc();
    authBloc.signIn(email, pass, () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: gotoHome));
    });
  }

  void onSignup() {
    Navigator.push(context, MaterialPageRoute(builder: gotoSignup));
  }

  void forgotPass() {
    Navigator.push(context, MaterialPageRoute(builder: gotoForgotPass));
  }

  Widget gotoHome(BuildContext context) {
    return HomePage();
  }

  Widget gotoSignup(BuildContext context) {
    return SignupPage();
  }

  Widget gotoForgotPass(BuildContext context) {
    return ForgotPassword();
  }
}
