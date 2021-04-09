import 'package:flutter/material.dart';
import 'package:demo1/styles/header.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

Future<void> submit(String one, two, three) async {
  var url = 'http://localhost:3000/users';
      await post(url, body: {'username': one, 'email': two, 'password': three});
}

class _SignUpState extends State<SignUp> {

  TextEditingController pass1 = TextEditingController();
  TextEditingController pass2 = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    //GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    AlertDialog alert(String text) {
      AlertDialog alert = AlertDialog(
        title: Text(text),
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
      );
      return alert;
    }

    return Scaffold(
        body: SingleChildScrollView(
            // physics: NeverScrollableScrollPhysics(),
            child: Column(children: [
              Stack(children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width, 
                    height: MediaQuery.of(context).size.height, 
                    child: Image.asset(
                      'images/cc.jpg', 
                      fit: BoxFit.cover,
                    )), 
                SizedBox(
                    width: MediaQuery.of(context).size.width, 
                    height: MediaQuery.of(context).size.height, 
                    child: SafeArea(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 35), 
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end, 
                                children: [
                                  Expanded(flex: 2, child: Header()), 
                                  Expanded(
                                      flex: 2, 
                                      child: Container(
                                        width: double.infinity,
                                
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'SIGN UP', 
                                              style: TextStyle(
                                                  fontSize: 43, 
                                                  fontWeight: FontWeight.bold, 
                                                  color: Colors.white),
                                            ), 
                                            SizedBox(height: 8), 
                                            Text(
                                              "Become Part Of the Family", 
                                              style: TextStyle(
                                                fontSize: 15, 
                                                color: Colors.white, 
                                                letterSpacing: 1.2,
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                  Form(
                                    child: Expanded(
                                        flex: 7, 
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end, 
                                            children: <Widget>[
                                              TextFormField(
                                                maxLength: 7,
                                                controller: username,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                    floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                    labelText: 'Username'),),
                                              SizedBox(height: 25),
                                              TextFormField(
                                                controller: email,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                    floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                    labelText: 'Email'),),
                                              SizedBox(height: 25),
                                              TextFormField(
                                                controller: pass1,
                                                obscureText: true,
                                                decoration: InputDecoration(
                                                    floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                    labelText: 'Password'),),
                                              SizedBox(height: 25),
                                              TextFormField(
                                                controller: pass2,
                                                obscureText: true,
                                                decoration: InputDecoration(
                                                    floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                    labelText: 'Confirm Password'),),
                                            ]))),
                                  SizedBox(height: 10,),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      children: [
                                        Material(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.circular(2),
                                          child: InkWell(
                                            highlightColor: Colors.blueAccent,
                                            hoverColor: Colors.blue[300],
                                            borderRadius: BorderRadius.circular(2),
                                            onTap: () async {
                                              await new Future.delayed( Duration(seconds: 3));
                                              setState(() {
                                                if (email.text.isEmpty || pass1.text.isEmpty || username.text.isEmpty) {
                                                  showDialog(context: context,
                                                      builder:(_) => alert('Fill All Fields')
                                                  ); }
                                                else if (pass1.text != pass2.text) {
                                                  showDialog(context: context,
                                                      builder: (_) => alert("Passwords Do Not Match")
                                                  );
                                                }
                                                else {
                                                  submit(username.text, email.text,
                                                      pass1.text);
                                                  showDialog(
                                                    barrierDismissible: false,
                                                      context: context,
                                                      builder: (_) => AlertDialog(
                                                        title:
                                                        Text('Account Created'),
                                                        actions: <Widget>[
                                                          Center(
                                                            child: FlatButton(
                                                              child: Text("OK"),
                                                              onPressed: () {
                                                                Navigator.pushNamedAndRemoveUntil(context,
                                                                  '/welcome', (Route<dynamic> route) => false);
                                                        }, textColor: Colors.blueAccent,),
                                                    )
                                                  ],
                                                ));
                                                }

                                              });
                                              },
                                            child: Container(
                                              height: 53,
                                              decoration: BoxDecoration(
                                                  border:
                                                  Border.all(color: Colors.white),
                                                  borderRadius:
                                                  BorderRadius.circular(2)),
                                              width: 140,
                                              child: Center(
                                                child: Text(
                                                  'Create Account',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.circular(2),
                                          child: InkWell(
                                            highlightColor: Colors.blueAccent,
                                            hoverColor: Colors.blue[300],
                                            borderRadius: BorderRadius.circular(2),
                                            onTap: () {
                                              Navigator.pop(context);
                                              },
                                            child: Container(
                                              height: 53,
                                              decoration: BoxDecoration(
                                                  border:
                                                  Border.all(color: Colors.white),
                                                  borderRadius:
                                                  BorderRadius.circular(2)),
                                              width: 110,
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
                                        ),
                                      ],
                                    ),
                                  )
                                ]))))
              ])
            ])));
  }
}
