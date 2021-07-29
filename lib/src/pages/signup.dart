import 'package:flutter/material.dart';
import 'package:flutter_user/src/blocs/auth_bloc.dart';
import 'package:flutter_user/src/pages/home.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  AuthBloc authBloc = AuthBloc();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("USER"),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xff3277d8)),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        color: Colors.white,
        constraints: const BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Signup new user",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: StreamBuilder(
                stream: authBloc.nameStream,
                builder: (context, snapshot) => TextField(
                  controller: _nameController,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  decoration: const InputDecoration(
                      labelText: 'Full name',
                      //errorText: snapshot.error,
                      labelStyle:
                          TextStyle(color: Color(0xff888888), fontSize: 15)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: StreamBuilder(
                stream: authBloc.phoneStream,
                builder: (context, snapshot) => TextField(
                  controller: _phoneController,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  decoration: const InputDecoration(
                      labelText: 'Phone',
                      //errorText: snapshot.hasError ? snapshot.error : null,
                      labelStyle:
                          TextStyle(color: Color(0xff888888), fontSize: 15)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: StreamBuilder(
                stream: authBloc.emailStream,
                builder: (context, snapshot) => TextField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      //errorText: snapshot.hasError ? snapshot.error : null,
                      labelStyle:
                          TextStyle(color: Color(0xff888888), fontSize: 15)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
              child: StreamBuilder(
                stream: authBloc.passStream,
                builder: (context, snapshot) => TextField(
                  controller: _passController,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      //errorText: snapshot.hasError ? snapshot.error : '',
                      labelStyle:
                          TextStyle(color: Color(0xff888888), fontSize: 15)),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: RaisedButton(
                onPressed: _onSignUp,
                color: Colors.blue,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: const Text(
                  "Sign up",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSignUp() {
    var isValid = authBloc.isValid(_nameController.text, _emailController.text,
        _passController.text, _phoneController.text);
    //print(_emailController.text);
    if (isValid) {
      authBloc.signUp(_emailController.text, _passController.text, _nameController.text, _phoneController.text, () {
          Navigator.of(context).push(MaterialPageRoute(builder: gotoHome));
          print('ok');
        }
      );
    }
  }
  Widget gotoHome(BuildContext context) {
    return const HomePage();
  }
}
