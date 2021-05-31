import 'package:flutter/material.dart';
import 'package:calculator_and_currency/components/constants.dart';


class NumberButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color fontColor;
  final Function pressFunction;
  final BuildContext context;

  NumberButton({
    @required this.context, 
    @required this.text, 
    @required this.fontSize, 
    this.fontColor = Colors.black, 
    this.pressFunction
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(8),
      child: SizedBox(
        height: 75,
        width: 75,
        child: TextButton(
          child: Text(
            text,
            style: TextStyle(
              color: fontColor,
              fontSize: fontSize,
              fontFamily: 'SanFrancisco',
              fontWeight: FontWeight.w700,
            ),
          ),
          onPressed: () {
            pressFunction();
          },
          style: ButtonStyle(
            // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(7)),
            overlayColor: MaterialStateProperty.all<Color>(highlightedColor), 
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              )
            )
          ),
        ),
      ),
    );
  }
}