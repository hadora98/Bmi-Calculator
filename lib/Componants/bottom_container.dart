import 'package:flutter/material.dart';
import '../constants.dart';
class BottomContainer extends StatelessWidget {
  final String text;
  final Function onTap;
  BottomContainer({@required this.text,@required this.onTap});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child:Text(

          text.toUpperCase(),
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w300,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,

      ),
    );
  }
}
