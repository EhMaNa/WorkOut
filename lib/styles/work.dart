import 'package:flutter/material.dart';



class MyCard extends StatefulWidget {
   final String image;
   final String name;
   final String argText;
   final String arghead;
   const MyCard({Key key, this.image, this.name, this.argText, this.arghead});

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/desc', arguments: {
          'text': widget.argText,
          'head': widget.arghead
        });
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10.0, bottom: 10.0),
            child: Container(
                height: 192,
                width: 172,
                child: Image.asset('images/${widget.image}.png')),
          ),
          Text(
            widget.name,
            style: TextStyle(fontSize: 20, color: Colors.white, ),
          )
        ],
      ),
    );
  }
}



