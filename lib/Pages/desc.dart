import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:demo1/styles/header.dart';
import 'package:demo1/Pages/timer.dart';

class Desc extends StatefulWidget {
  @override
  _DescState createState() => _DescState();
}

class _DescState extends State<Desc> {
  @override
  Widget build(BuildContext context) {
    Map dataReceived = ModalRoute.of(context).settings.arguments;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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
                          /*Expanded(
                              flex: 4,
                              child: Column(
                                children: [

                                  SizedBox(height: 30),
                                  Image.asset(dataReceived['image'],
                                     )
                                ],
                              )),*/
                          SizedBox(height: 20,),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(dataReceived['head'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),),
                              SizedBox(height: 17,),
                              Flexible(
                                  fit: FlexFit.loose,
                                  child: Text(dataReceived['text'],
                                    style: TextStyle(fontSize: 17), softWrap: true, textAlign: TextAlign.center,)
                              ),
                              SizedBox(height: 50,),
                              Flexible(
                                flex: 9,
                                child: Material(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(2),
                                  child: InkWell(
                                    highlightColor: Colors.blueAccent,
                                    hoverColor: Colors.blue[300],
                                    borderRadius: BorderRadius.circular(2),
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Timer()));
                                    },
                                    child: Container(
                                      height: 33,
                                      decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(2)),
                                      width: 110,
                                      child: Center(
                                        child: Text(
                                          'Begin',
                                          style: TextStyle(fontSize: 16, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
