import 'Screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'Screens/input_Page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.

        // When navigating to the "/second" route, build the SecondScreen widget.
        '/result': (context) => ResultScreen(),
      },
      theme:ThemeData.dark().copyWith(

        scaffoldBackgroundColor: Color(0xFF0A0D22),
        primaryColor: Color(0xFF0A0D22),
      ),
      home: InputPage(),
    );
  }
}



