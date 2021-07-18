import 'file:///C:/Users/hador/AndroidStudioProjects/bmi-calculator-flutter/lib/Componants/bottom_container.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:bmi_calculator/Componants/reusable_card.dart';
import 'package:bmi_calculator/Screens/input_Page.dart';


Map<String,String> bmiText ={
  "underWeight":"Your BMI is quite low, you should eat more",
  "Fit":"Your BMI is Perfect, you should continue on your Current routine",
  "overWeight":"Your BMI is high, you should start  eating healthier",

};

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {@required this.interpretation,
        @required this.bmiResult,
        @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Your Result",
            style: kTitleTextStyle,
          ),
          Container(

              child: Expanded(
                flex: 5,
                child: ReusableCard(

                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,


                    children: [
                      Text(resultText.toUpperCase(),
                      style:resultText.toUpperCase()=="NORMAL"?kResultTextStyleGreen:kResultTextStyleRed,
                      ),

                      Text(bmiResult.toString(),
                    style:kBMITextStyle,
                ),

                      Padding(
                        padding: const EdgeInsets.only(left:8.0,right: 8.0),
                        child: Text(
                         interpretation,

                          style:kBodyTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ],
                  ),
                  color: kInactiveCardColor,
                ),
              ),
            ) ,
          BottomContainer(
              text: "Re-calculate",
            onTap: (){
                  Navigator.pop(context);


            },

          ),
        ],
      ),

    );
  }
}
