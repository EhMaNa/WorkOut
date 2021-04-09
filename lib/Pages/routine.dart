import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:demo1/styles/model.dart';
import 'package:flushbar/flushbar.dart';



class Routine extends StatefulWidget {
  @override
  _RoutineState createState() => _RoutineState();
}

class _RoutineState extends State<Routine> {
  List<String> abs = ["Sit-Ups","V-Sits", "Plank","Bicycle Crunches", "Heel Touches", ];
  List<String> back = ["Side Plank","Dead Lift","Rear Delt Fly", "Superman","Bird Dog"];
  List<String> card = ["High Knees", "Jumping Jacks","Mountain Climbers", "Star Jumps","Treadmill Run"];
  List<String> arm = ["Push-Ups","Bench Press","Dumbbell Overhead Press","Lateral Raise","Shoulder Press"];
  List<String> leg = ["Leg Press","Chair Squats","Straight-Leg Donkey Kick","Stationary Lunge"];





  List <String> abs1 = ['images/m1.png','images/m2.png','images/2.png','images/h4.png','images/h5.png'];
  List <String> back1 = ['images/h1.png','images/g1.png','images/m4.png','images/m3.png', 'images/4.png'];
  List <String> card1 = ['images/k1.png','images/k2.png','images/m5.png','images/k3.png', 'images/g4.png'];
  List <String> arm1 = ['images/h2.png','images/g3.png','images/h3.png','images/k4.png', 'images/g5.png'];
  List <String> leg1 = ['images/g2.png','images/5.png','images/3.png', 'images/1.png'];


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Provider.of<Post>(context, listen: false,).routines.clear();
        Navigator.pop(context);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 4.00,
            title: Text("Select Workouts"),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text('  Ab Workouts', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),),
                SizedBox(height: 5,),
                Container(child: provideList(abs, abs1), height: 350,),

                SizedBox(height: 20,),
                Text('  Back Workouts', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),),
                SizedBox(height: 5,),
                Container(child: provideList(back, back1), height: 350,),

                SizedBox(height: 20,),
                Text('  Cardio Workouts', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),),
                SizedBox(height: 5,),
                Container(child: provideList(card, card1), height: 350,),

                SizedBox(height: 20,),
                Text('  Arm Workouts', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),),
                SizedBox(height: 5,),
                Container(child: provideList(arm, arm1), height: 350,),

                SizedBox(height: 20,),
                Text('  Leg Workouts', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),),
                SizedBox(height: 5,),
                Container(child: provideList(leg, leg1), height: 350,),
              ],
            ),
          ),
          floatingActionButton: Consumer<Post>(builder: (context, post, child) {
            return FloatingActionButton(
              child: Icon(
                Icons.done_outlined,
                size: 30,
              ),
              tooltip: 'Add Routine',
              onPressed: () {
                setState(() {
                  showDialog(context: context,
                  barrierDismissible: false,
                  builder: (_) => Alert(name: 'Add a Name'));
                });

              },
            );
          }
          ),
        ),
      ),
    );
  }
}


Widget provideList (list, list1) {
  bool uno = false;
  var menu = ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    itemCount: list.length,
      itemBuilder: (context, count) {
      return Padding(
        padding: EdgeInsets.all(2.5),
        child: Card(
          shadowColor: Colors.white54,
          elevation: 1.0,
          child: ListTile(
            title: Text(list[count],
            style: TextStyle(
            )
              ,),
            leading: CircleAvatar(
                backgroundImage: AssetImage(list1[count]),
            ),
            trailing: Check(val: uno, text: list[count],),
          ),
        ),
      );
      }
  );
  return menu;
}

void showInfoFlushbar(BuildContext context) {
  Flushbar(
    //title: '   Success',
    message: '   Added Successfully',
    icon: Icon(Icons.done_outline_rounded,
      color: Colors.green,
      size: 30,),

    duration: Duration(seconds: 8),
  )..show(context);
}

// ignore: must_be_immutable
class Check extends StatefulWidget {
  bool val;
  String text;

  Check({this.val, this.text});
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Post>(builder: (context, post, child) {
      return Checkbox(
        activeColor: Colors.blue,
        value: widget.val,
        onChanged: (bool v) {
          setState(() {
            widget.val = v;
            if (widget.val == true) {
              post.addToRoutine(widget.text);
              post.routines.forEach((element) {print(element);});
            } else {
              post.removeFromRoutine(widget.text);
            }
          }
          );
        },
      );
    }
    );
  }
}


// ignore: must_be_immutable
class Alert extends StatefulWidget {
   String name;
   Alert({this.name});
  @override
  _AlertState createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  TextEditingController textName = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Consumer<Post>(builder: (context, post, child) {
      return AlertDialog(
        title: Text(widget.name),
        content: TextField(
          controller: textName,
        ),
        actions: <Widget>[
          Center(
            child: Row(
              children: [
                FlatButton(
                  child: Text("Cancel",
                  style: TextStyle(
                    letterSpacing: 1.0
                  ),),
                  onPressed: () {
                    post.routines.clear();
                    Navigator.pop(context);
                  },
                  textColor: Colors.blueAccent,
                ),
                  FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      setState(() {
                        if (textName.text.isNotEmpty){
                          post.submit(textName.text, post.routines);
                          post.routines.clear();
                        } else {
                          post.routines.clear();
                        }
                      });
                      Navigator.pop(context);
                      showInfoFlushbar(context);
                    },
                    textColor: Colors.blueAccent,
                  ),

              ],
            ),
          )
        ],
      );
    }
    );
  }
}

