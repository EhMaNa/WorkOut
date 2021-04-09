import 'package:demo1/styles/Texts.dart';
import 'package:flutter/material.dart';
import 'package:demo1/styles/header.dart';
import 'package:flutter/services.dart';
import 'package:demo1/styles/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flushbar/flushbar.dart';




class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LocalAuthentication auth = LocalAuthentication();
  TextEditingController pass1 = TextEditingController();
  TextEditingController email1 = TextEditingController();
  bool isAuthenticating = false;
  String authorized = 'Not Authorized';

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        isAuthenticating = true;
        authorized = 'Authenticating';
      });
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason:
          'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true,
          /*biometricOnly: true*/);
      setState(() {
        isAuthenticating = false;
        authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        isAuthenticating = false;
        authorized = "Error - ${e.message}";
      });
      return;
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() async {
      authorized = message;
      if(authorized == "Authorized") {
         await Future.delayed( Duration(seconds: 2));
        Navigator.pushNamedAndRemoveUntil(context, '/home',(Route<dynamic> route) => false);
         showInfoFlushbar(context, 'Log In Successful');
      identity = 147;
      sam = 'Admin';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    //final _formKey = GlobalKey<FormState>();

    login(String email, String password) async {
      await new Future.delayed( Duration(seconds: 3));
      Users(email: email, password: password).getInfo().then((user) {
          if (user.username.isNotEmpty) {
             Navigator.pushNamedAndRemoveUntil(context, '/home',(Route<dynamic> route) => false, arguments: user);
             showInfoFlushbar(context, 'Log In Successful');
          } else {
            return showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: Text('Email Or Password Incorrect'),
                      actions: <Widget>[
                        Center(
                          child: FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            textColor: Colors.blueAccent,
                          ),
                        )
                      ],
                    ));
          }

      });
    }

    return Scaffold(
     resizeToAvoidBottomInset: true,
      //resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        //physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Image.asset(
                      'images/dd.jpg',
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: Column(
                        children: [
                          Expanded(flex: 4, child: Header()),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'LOG IN',
                              style: TextStyle(
                                  fontSize: 43,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Form(
                            // key: _formKey,
                            child: Expanded(
                                flex: 6,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    TextFormField(
                                      controller: email1,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5)),
                                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                                        labelText: 'Email',
                                      ),
                                    ),
                                    SizedBox(height: 25),
                                    TextFormField(
                                      controller: pass1,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5)),
                                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                                        labelText: 'Password',
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    FlatButton.icon(
                                      icon: Icon(Icons.fingerprint_outlined),
                                      label: Text('Use Fingerprint'),
                                      onPressed: _authenticateWithBiometrics,
                                      color: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                    )
                                  ],
                                )),
                          ),
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    highlightColor: Colors.blueAccent,
                                    hoverColor: Colors.blue[300],
                                    borderRadius: BorderRadius.circular(50),
                                    onTap: () => login(email1.text, pass1.text),
                                    child: Container(
                                      height: 53,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      width: double.infinity,
                                      child: Center(
                                        child: Text(
                                          'Log In',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Material(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    highlightColor: Colors.blueAccent,
                                    hoverColor: Colors.blue[300],
                                    borderRadius: BorderRadius.circular(50),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 53,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      width: double.infinity,
                                      child: Center(
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showInfoFlushbar(BuildContext context, String text) {
  Flushbar(
    title: '   Success',
    message: '   $text',
    icon: Icon(Icons.done_outline,
      color: Colors.green,
      size: 30,),

    duration: Duration(seconds: 8),
  )..show(context);
}