import 'package:flutter/material.dart';


class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: '  WorkOut ',
                style: TextStyle(fontSize: 34, letterSpacing: 5, color: Colors.white, ),

              ),
            ]),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
