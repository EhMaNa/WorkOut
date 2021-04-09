import 'package:flutter/material.dart';
import 'package:demo1/styles/header.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';



class Timer extends StatefulWidget {

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  CountDownController _controller = CountDownController();
  int duration = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                          Expanded(flex: 0, child: Header()),
                                          Expanded(child: CircularCountDownTimer(
                                            controller: _controller,
                                            autoStart: false,
                                            duration: duration,
                                            height: 50,
                                            ringColor: Colors.red,
                                            width: 350,
                                            isReverse: true,
                                            fillColor: Colors.white,
                                            backgroundColor: Colors.white,
                                            onStart: (){
                                            },
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
                                                onPressed: () => setState(() => duration += 60),
                                                child: Text(' +1 min '),
                                              ),
                                              SizedBox(width: 10),
                                              RaisedButton(
                                                onPressed: () => setState(() => duration = 300),
                                                child: Text(' 5 min '),
                                              ),
                                              SizedBox(width: 10),
                                              RaisedButton(
                                                onPressed: () => setState(() => duration = 600),
                                                child: Text(' 10 min '),
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
                                                    _controller.restart(duration: duration);
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
                                                onPressed: () => _controller.restart(duration: duration = 0),
                                                child: Text('Reset'),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 70,),
                                        ]
                                    )
                                )
                            )
                        ),
                      ]
                  )
                ]
            )
        ));
  }
}
