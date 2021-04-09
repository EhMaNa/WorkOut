import 'package:demo1/Pages/ModelTimer.dart';
import 'package:flutter/material.dart';

class Show extends StatefulWidget {
  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<Show> {
  @override
  Widget build(BuildContext context) {
    List dataReceived = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow_outlined),
        onPressed: ()  {
          dataReceived.forEach((element) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Timer1(name: element)), );
          });
        },
      ),
      appBar: AppBar(
        elevation: 4.00,
        title: Text("Workouts"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: dataReceived.length,
            itemBuilder: (context, count) {
              return ListTile(
                leading: Icon(Icons.circle,
                size: 14,
                color: Colors.white,),
                title: Text(dataReceived[count],
                style: Theme.of(context).textTheme.headline6),
              );
            }
        ),
      ),
    );
  }
}
