import 'package:flutter/material.dart';
class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.onPressed,@required this.icon});
  final Function onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed:onPressed,
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        width:56,
        height:56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: icon,

    );

  }
}

