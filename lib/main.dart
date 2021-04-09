import 'package:demo1/Pages/see.dart';
import 'package:demo1/Pages/home.dart';
import 'package:demo1/Pages/desc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:demo1/Pages/welcome.dart';
import 'package:demo1/Pages/Login.dart';
import 'package:demo1/Pages/signup.dart';
import 'package:demo1/Pages/routine.dart';
import 'package:provider/provider.dart';
import 'package:demo1/styles/model.dart';
import 'package:demo1/Pages/show.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Post>(
      create: (_) => Post(),
      child: new MaterialApp(
        initialRoute: "/",
        routes: {
          "/": (context) => MyApp(),
          "/welcome": (context) => Welcome(),
          "/login": (context) => Login(),
          "/sign": (context) => SignUp(),
          "/home": (context) => Home(),
          "/desc": (context) => Desc(),
          "/routine": (context) => Routine(),
          "/show": (context) => Show(),
          "/see": (context) => See(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
      ),
    );
  }
}



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return SplashScreen(
      seconds: 15,
      navigateAfterSeconds: Welcome(),
      photoSize: 80,
      title: new Text(
        'WorkOut',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0, color: Colors.white, letterSpacing: 5),
      ),
      image: Image.asset("images/ts.png",),
      backgroundColor: Colors.black,
      loaderColor: Colors.blue,
    );
  }
}






