import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';




// ignore: must_be_immutable
class See extends StatefulWidget {
  @override
  _SeeState createState() => _SeeState();
}

class _SeeState extends State<See> {
  CountDownController _controller = CountDownController();
  int duration = 6;


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
                                         // Expanded(flex: 0, child: Header()),
                                          Expanded(child: CircularCountDownTimer(
                                            controller: _controller,
                                            autoStart: true,
                                            duration: duration,
                                            height: 50,
                                            ringColor: Colors.transparent,
                                            width: 300,
                                            onComplete: ()  {
                                              Navigator.pop(context);},
                                            isReverse: true,
                                            fillColor: Colors.transparent,
                                            backgroundColor: Colors.transparent,
                                            strokeWidth: 10,
                                            isTimerTextShown: true,
                                            textStyle: TextStyle(
                                                fontSize: 93.0, color: Colors.white, fontWeight: FontWeight.bold),
                                          )
                                          ),
                                          SizedBox(height: 10,),
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
