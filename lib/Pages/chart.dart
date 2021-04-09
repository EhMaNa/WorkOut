import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:demo1/styles/Texts.dart';



class Chart extends StatefulWidget {
  //Chart({Key key, this.title}) : super(key: key);

  //final String title;

  @override
  _ChartState createState() => _ChartState();
}

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class _ChartState extends State<Chart> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = [
      ClicksPerYear('Mon', 12, Colors.red),
      ClicksPerYear('Tue', 42, Colors.yellow),
      ClicksPerYear('Wed', _counter, Colors.green),
      ClicksPerYear('Thu', num, Colors.blue),
      ClicksPerYear('Fri', 12, Colors.white),
      ClicksPerYear('Sat', 42, Colors.blue),
      ClicksPerYear('Sun', 12, Colors.white),
    ];

    var series = [
      charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
      ),
    ];

    var chart = charts.BarChart(
      series,
      animate: false,
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(30.0),
      child: SizedBox(
        height: 200.0,
        child: chart,
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Title')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.headline4),
            chartWidget,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}