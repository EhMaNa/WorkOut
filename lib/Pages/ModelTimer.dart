import 'package:flutter/material.dart';
import 'package:demo1/styles/header.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flushbar/flushbar.dart';



// ignore: must_be_immutable
class Timer1 extends StatefulWidget {
  String name;
  Timer1({this.name});
  @override
  _Timer1State createState() => _Timer1State();
}

class _Timer1State extends State<Timer1> {
  CountDownController _controller = CountDownController();
  int duration = 0;



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                                'images/Rectangle.png',
                                fit: BoxFit.cover,
                              )),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: SafeArea(
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 35),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 50,),
                                            //Expanded(flex: 0, child: Header()),
                                            Text(widget.name,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 30,
                                            ),),
                                            Expanded(child: CircularCountDownTimer(
                                              controller: _controller,
                                              autoStart: false,
                                              duration: duration,
                                              height: 50,
                                              ringColor: Colors.deepPurple,
                                              width: 300,
                                              onComplete: () async {
                                                //await new Future.delayed( Duration(seconds: 5));
                                                Navigator.popAndPushNamed(context, '/see' );
                                                //num += duration;
                                                //Navigator.pop(context);
                                                },
                                              isReverse: true,
                                              fillColor: Colors.white,
                                              backgroundColor: Colors.white,
                                              strokeWidth: 10,
                                              isTimerTextShown: true,
                                              textStyle: TextStyle(
                                                  fontSize: 33.0, color: Colors.blueGrey, fontWeight: FontWeight.bold),
                                            )
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                RaisedButton(
                                                  onPressed: () => setState(() {
                                                    duration += 30;
                                                    showInfoFlushbar(context, duration.toString());
                                                  }),
                                                  child: Text(' +30 sec '),
                                                ),
                                                SizedBox(width: 10),
                                                RaisedButton(
                                                  onPressed: () => setState(() {
                                                    duration = 60;
                                                    showInfoFlushbar(context, duration.toString());
                                                  }),
                                                  child: Text(' 1 min '),
                                                ),
                                                SizedBox(width: 10),
                                                RaisedButton(
                                                  onPressed: () => setState(() {
                                                    duration = 300;
                                                    showInfoFlushbar(context, duration.toString());
                                                  }),
                                                  child: Text(' 5 min '),
                                                ),
                                                SizedBox(width: 10),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                RaisedButton(
                                                  onPressed: () {
                                                    if (duration == 0){
                                                      _controller.pause();
                                                    }
                                                  else {_controller.restart(duration: duration);}
                                                  },
                                                  child: Text('Start'),
                                                ),
                                                SizedBox(width: 10),
                                                RaisedButton(
                                                  onPressed: () => _controller.pause(),
                                                  child: Text('Stop'),
                                                ),
                                                SizedBox(width: 10),
                                                RaisedButton(
                                                  onPressed: () {
                                                    _controller.resume();
                                                  },
                                                  child: Text('Resume'),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                RaisedButton(
                                                  onPressed: () => Navigator.pop(context),
                                                  child: Text('Skip'),
                                                ),
                                                SizedBox(width: 10),
                                                RaisedButton(
                                                  onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/show')),
                                                  child: Text('End'),
                                                ),
                                                SizedBox(width: 10),
                                              ],
                                            ),
                                            SizedBox(height: 40,),
                                          ]
                                      )
                                  )
                              )
                          ),
                        ]
                    )
                  ]
              )
          )),
    );
  }
}

void showInfoFlushbar(BuildContext context, String text) {
  Flushbar(
    //title: '   Success',
    message: '   $text seconds',

    duration: Duration(seconds: 4),
  )..show(context);
}

