import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo1/styles/header.dart';
import 'package:flutter/services.dart';


class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      body: Stack(
        children: [
          backgroundImg(),
          Container(
            color: Colors.grey[900].withOpacity(0.8),
          ),
          Column(
            children: [
              Expanded(flex: 3, child: Header()),
              Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40,),
                    child: Column(
                        children: [
                          Expanded(
                              flex: 4,
                              child: Container(
                                width: double.infinity,
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Welcome',
                                      style: TextStyle(fontSize: 43, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Here to provide you with your daily workout routines",
                                      style: TextStyle(fontSize: 15, color: Colors.white,letterSpacing: 1.2, ),
                                    )
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(50),
                                    child: InkWell(
                                      highlightColor: Colors.blueAccent,
                                      hoverColor: Colors.blue[300],
                                      borderRadius: BorderRadius.circular(50),
                                      onTap: () {Navigator.pushNamed(context, "/login");},
                                      child: Container(
                                        height: 53,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white),
                                            borderRadius: BorderRadius.circular(50)),
                                        width: double.infinity,
                                        child: Center(
                                          child: Text(
                                            'Login',
                                            style:TextStyle(fontSize: 16, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Material(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(50),
                                    child: InkWell(
                                      highlightColor: Colors.blueAccent,
                                      hoverColor: Colors.blue[300],
                                      borderRadius: BorderRadius.circular(50),
                                      onTap: () {Navigator.pushNamed(context, "/sign");},
                                      child: Container(
                                        height: 53,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white),
                                            borderRadius: BorderRadius.circular(50)),
                                        width: double.infinity,
                                        child: Center(
                                          child: Text(
                                            'Sign Up',
                                            style:TextStyle(fontSize: 16, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )

                                ],
                              )
                          ),

                        ]
                    ),
                  ))
            ],

          )
        ],
      ),
    );
  }
}

SizedBox backgroundImg (){
  return SizedBox.expand(
      child: Image.asset(
        "images/xx.jpg",
        fit: BoxFit.cover,)
  );
}
