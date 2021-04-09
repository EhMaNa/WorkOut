import 'package:demo1/Pages/myroutine.dart';
import 'package:flutter/material.dart';
import 'package:demo1/styles/work.dart';
import 'package:flutter/services.dart';
import 'package:demo1/styles/header.dart';
import 'package:demo1/styles/Texts.dart';
import 'package:flushbar/flushbar.dart';
import 'package:provider/provider.dart';
import 'package:demo1/styles/model.dart';


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool value = false;

  void handleClick(String value) {
    switch (value) {
      case 'View Routines':
        {

            Navigator.push(context, MaterialPageRoute(builder: (context) => MyRoutine()));

        }

        break;

      case 'Log Out':
        {
            Navigator.pushNamedAndRemoveUntil(context, "/welcome", (Route<dynamic> route) => false);
            Provider.of<Post>(context, listen: false,).title.clear();
            Provider.of<Post>(context, listen: false,).collect.clear();
            sam = '';
            identity = 0;
            showInfoFlushbar(context);
        }
        break;
    }
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(
          Icons.add,
          size: 30,
        ),
        label: Text('Create Routine'),
        tooltip: 'Add Routine',
        onPressed: (){
          Navigator.pushNamed(context, '/routine');
        },
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Image.asset(
                      'images/details.png',
                      fit: BoxFit.cover,
                    )),
                Image.asset(
                  'images/Rectangle.png',
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(flex: 0, child: Header()),
                          Expanded(
                            flex: 0,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                              CircleAvatar(
                                backgroundImage: AssetImage("images/uu.png"),
                                backgroundColor: Colors.white,
                                radius: 47.0,
                              ),
                              SizedBox(
                                width: 10,),
                                  Text(
                                    'Hi, $sam',
                                    style: TextStyle(fontSize: 19),
                                  ),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.17,),
                              PopupMenuButton<String>(
                                onSelected: handleClick,
                                itemBuilder: (BuildContext context) {
                                  return {
                                    'View Routines',
                                    'Log Out',
                                  }.map((String choice) {
                                    return PopupMenuItem<String>(
                                      value: choice,
                                      child: Text(choice),
                                    );
                                  }).toList();
                                },
                              ),
                            ]),

                          ),
                          SizedBox(height: 20,),
                          Expanded(
                            flex: 7,
                            child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Material(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        borderOnForeground: true,
                                        child: Container(
                                          height: 30,
                                          width: 190,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Text(
                                            '   Abs Workouts',
                                            style: TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            MyCard(
                                              image: 'm2',
                                              name: "V-Sits",
                                              argText: vsit,
                                              arghead: vsit1,
                                            ),
                                            MyCard(
                                              image: '2',
                                              name: "Plank",
                                              argText: plank,
                                              arghead: plank1,
                                            ),
                                            MyCard(
                                              image: 'm1',
                                              name: "Sit-Ups",
                                              argText: sit,
                                              arghead: sit1,
                                            ),
                                            MyCard(
                                              image: 'h4',
                                              name: "Bicycle Crunches",
                                              argText: bCrunch,
                                              arghead: bCrunch1,
                                            ),

                                            MyCard(
                                              image: 'h5',
                                              name: "Heel Touches",
                                              argText: heel,
                                              arghead: heel1,
                                            ),

                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Material(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        borderOnForeground: true,
                                        child: Container(
                                          height: 30,
                                          width: 190,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Text(
                                            '   Leg Workouts',
                                            style: TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            MyCard(
                                              image: '1',
                                              name: "Stationary Lunge",
                                              argText: sLung,
                                              arghead: sLung1,
                                            ),

                                            MyCard(
                                              image: 'g1',
                                              name: "Dead Lift",
                                              argText: dead,
                                              arghead: dead1,
                                            ),
                                            MyCard(
                                              image: '3',
                                              name: "Straight-Leg Donkey Kick",
                                              argText: sDonk,
                                              arghead: sDonk1,
                                            ),
                                            MyCard(
                                              image: 'g2',
                                              name: "Leg Press",
                                              argText: lPress,
                                              arghead: lPress1,
                                            ),
                                            MyCard(
                                              image: '5',
                                              name: "Chair Squats",
                                              argText: cSquat,
                                              arghead: cSquat1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 30,),
                                      Material(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        borderOnForeground: true,
                                        child: Container(
                                          height: 30,
                                          width: 190,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Text(
                                            '  Back Workouts',
                                            style: TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            MyCard(
                                              image: 'h1',
                                              name: "Side Plank",
                                              argText: sPlank,
                                              arghead: sPlank1,
                                            ),
                                            MyCard(
                                              image: '4',
                                              name: "Bird Dog",
                                              argText: brdg,
                                              arghead: brdg1,
                                            ),
                                            MyCard(
                                              image: 'm3',
                                              name: "Superman",
                                              argText: supes,
                                              arghead: supes1,
                                            ),
                                            MyCard(
                                              image: 'm4',
                                              name: "Rear Delt Fly",
                                              argText: rdf,
                                              arghead: rdf1,
                                            ),
                                            MyCard(
                                              image: 'g1',
                                              name: "Dead Lift",
                                              argText: dead,
                                              arghead: dead1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 30,),
                                      Material(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        borderOnForeground: true,
                                        child: Container(
                                          height: 30,
                                          width: 200,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white),
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                          child: Text(
                                            '  Cardio Workouts',
                                            style: TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            MyCard(
                                              image: 'k2',
                                              name: "Jumping Jacks",
                                              argText: jump,
                                              arghead: jump1,
                                            ),
                                            MyCard(
                                              image: 'k1',
                                              name: "High Knees",
                                              argText: hi,
                                              arghead: hi1,
                                            ),
                                            MyCard(
                                              image: 'g4',
                                              name: "Treadmill Run",
                                              argText: tread,
                                              arghead: tread1,
                                            ),
                                            MyCard(
                                              image: 'm5',
                                              name: "Mountain Climbers",
                                              argText: mClimb,
                                              arghead: mClimb1,
                                            ),
                                            MyCard(
                                              image: 'k3',
                                              name: "Star Jumps",
                                              argText: sJump,
                                              arghead: sJump1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 30,),
                                      Material(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        borderOnForeground: true,
                                        child: Container(
                                          height: 30,
                                          width: 185,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white),
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                          child: Text(
                                            '  Arm Workouts',
                                            style: TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            MyCard(
                                              image: 'h2',
                                              name: "Push-Ups",
                                              argText: pushups,
                                              arghead: pushups1,
                                            ),
                                            MyCard(
                                              image: 'k4',
                                              name: "Lateral Raise",
                                              argText: lRaise,
                                              arghead: lRaise1,
                                            ),
                                            MyCard(
                                              image: 'g5',
                                              name: "Shoulder Press",
                                              argText: sPress,
                                              arghead: sPress1,
                                            ),
                                            MyCard(
                                              image: 'g3',
                                              name: "Bench Press",
                                              argText: bPress,
                                              arghead: bPress1,
                                            ),
                                            MyCard(
                                              image: 'h3',
                                              name: "Dumbbell Overhead Press ",
                                              argText: overDumb,
                                              arghead: overDumb1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ])),
                          ),
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

void showInfoFlushbar(BuildContext context) {
  Flushbar(
    title: '   Success',
    message: '   Logged Out Successfully',
    icon: Icon(Icons.done_outline,
    color: Colors.green,
    size: 30,),

    duration: Duration(seconds: 8),
  )..show(context);
}

