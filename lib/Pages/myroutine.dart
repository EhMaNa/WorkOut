import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo1/styles/model.dart';
import 'package:http/http.dart';
import 'package:demo1/styles/Texts.dart';
import 'package:flushbar/flushbar.dart';

class MyRoutine extends StatefulWidget {
  @override
  _MyRoutineState createState() => _MyRoutineState();
}


class _MyRoutineState extends State<MyRoutine> {

@override
  Widget build(BuildContext context) {
    return Consumer<Post>(
      builder: (context, post , child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('My Routines'),
          actions: [
            GestureDetector(
              child: Icon(Icons.refresh,
              size: 25,),
              onTap: () {
                Provider.of<Post>(context, listen: false,).fetch('http://localhost:3000/Identity$identity');
                setState(() {
                  /*ListView.builder(
                      itemCount: post.collect.length,
                      itemBuilder: (context, count) {
                        return Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Card(
                            child: ListTile(
                              title: Text(post.title[count]),
                             /* trailing: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      post.collect.removeAt(count);
                                      post.title.removeAt(count);
                                      int del = count;
                                      del++;
                                      delete('http://10.0.2.2:3000/Identity$identity/$del',);
                                      print(post.title);
                                      print(post.collect);
                                      print(post.routines);
                                    });
                                  },
                                  child: Icon(Icons.delete)
                              ),
                              onTap: (){
                                Navigator.pushNamed(context, '/show', arguments: post.collect[count]);
                              },*/
                            ),
                          ),
                        );
                      }
                  );*/
                });
                },
            ),
            SizedBox(width: 40,)
          ],
        ),
        body: Container(
          child: post.collect.isEmpty && post.title.isEmpty ?
          Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.sentiment_very_dissatisfied_rounded,
                  size: 100,),
                  SizedBox(height: 10),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children:[ Text('Oops....Empty',
                style: TextStyle(fontSize: 29),),]
                  ),
                ]
              )
          )
              : ListView.builder(
              itemCount: post.collect.length,
              itemBuilder: (context, count) {
                return Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Card(
                    child: ListTile(
                      title: Text(post.title[count]),
                      trailing: GestureDetector(
                          onTap: (){
                            setState(() {
                              post.collect.removeAt(count);
                              post.title.removeAt(count);
                              int del = count;
                              del++;
                              delete('http://localhost:3000/Identity$identity/$del',);
                              showInfoFlushbar(context);
                              print(post.title);
                              print(post.collect);
                              print(post.routines);
                            });
                                },
                          child: Icon(Icons.delete)
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, '/show', arguments: post.collect[count]);
                        },
                    ),
                  ),
                );
              }
              ),
          ),
        );

  }
    );
  }
}

void showInfoFlushbar(BuildContext context) {
  Flushbar(
    //title: '   Success',
    message: '   Deleted Successfully',
    icon: Icon(Icons.done_outline_outlined,
      color: Colors.green,
      size: 30,),

    duration: Duration(seconds: 5),
  )..show(context);
}

