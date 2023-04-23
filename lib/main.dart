import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = '0';

  void buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      setState(() {
        display = '0';
      });
    } else if (buttonText == '.') {
      if (display.contains('.')) {
        return;
      } else {
        setState(() {
          display = display + buttonText;
        });
      }
    } else {
      setState(() {
        if (display == '0') {
          display = buttonText;
        } else {
          display = display + buttonText;
        }
      });
    }
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(24.0),
          textStyle: TextStyle(fontSize: 36.0),
        ),
        child: Text(buttonText),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              display,
              style: TextStyle(fontSize: 64.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            children: <Widget>[
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('.'),
              buildButton('0'),
              buildButton('C'),
            ],
          ),
        ],
      ),
    );
  }
}