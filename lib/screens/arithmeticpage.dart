import 'package:flutter/material.dart';
import 'package:calculator_and_currency/components/constants.dart';
import 'package:calculator_and_currency/components/numberButton.dart';
import 'package:calculator_and_currency/service/calculation.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ArithmeticPage extends StatefulWidget {
  ArithmeticPage({Key key}) : super(key: key);

  @override
  _ArithmeticPageState createState() => _ArithmeticPageState();
}

class _ArithmeticPageState extends State<ArithmeticPage> {
  String number = '';
  String resultShowed = '';
  String resultData = '';
  bool isClearr = true;
  bool isLastInputWasNumber = false;
  bool isLastInputWasNOperator = false;
  String operators = '';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: AutoSizeText(
                resultShowed,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'SanFrancisco',
                  fontWeight: FontWeight.w500,
                  color: secondaryColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: screenHeight / 10,
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: AutoSizeText(
                number,
                maxLines: 1,
                style: TextStyle(
                  fontFamily: 'SanFrancisco',
                  fontSize: numberFontSize + 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: <Color>[primaryColor, secondaryColor],
            ).createShader(Rect.fromLTWH(150.0, 0.0, 100.0, 0.0));
          },
          child: Container(
            height: 3,
            width: double.infinity,
            color: Colors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NumberButton(
              context: context,
              text: '7',
              fontSize: numberFontSize,
              pressFunction: () {
                setState(() {
                  if (number.length >= 15) {
                    _showMyDialog();
                  } else {
                    List<String> results = Calculation.numberPressed(
                        resultData, number, '7', isClearr, operators);
                    number = results[0];
                    resultShowed = results[1];
                  }
                  isLastInputWasNumber = true;
                  isLastInputWasNOperator = false;
                });
              },
            ),
            NumberButton(
              context: context,
              text: '8',
              fontSize: numberFontSize,
              pressFunction: () {
                setState(() {
                  if (number.length >= 15) {
                    _showMyDialog();
                  } else {
                    List<String> results = Calculation.numberPressed(
                        resultData, number, '8', isClearr, operators);
                    number = results[0];
                    resultShowed = results[1];
                  }
                  isLastInputWasNumber = true;
                  isLastInputWasNOperator = false;
                });
              },
            ),
            NumberButton(
              context: context,
              text: '9',
              fontSize: numberFontSize,
              pressFunction: () {
                setState(() {
                  if (number.length >= 15) {
                    _showMyDialog();
                  } else {
                    List<String> results = Calculation.numberPressed(
                        resultData, number, '9', isClearr, operators);
                    number = results[0];
                    resultShowed = results[1];
                  }
                  isLastInputWasNumber = true;
                  isLastInputWasNOperator = false;
                });
              },
            ),
            NumberButton(
              context: context,
              text: 'c',
              fontSize: numberFontSize,
              fontColor: primaryColor,
              pressFunction: () {
                setState(() {
                  number = '';
                  resultShowed = '';
                  resultData = '';
                  isClearr = true;
                  operators = '';
                  isLastInputWasNumber = false;
                  isLastInputWasNOperator = false;
                });
              },
            ),
            NumberButton(
              context: context,
              text: 'del',
              fontSize: 30,
              fontColor: primaryColor,
              pressFunction: () {
                setState(() {
                  List<String> results = Calculation.delPressed(resultData, number, isLastInputWasNumber, isLastInputWasNOperator, operators);
                  number = results[0];
                  resultShowed = results[1];
                  operators = results[2];
                });
              }
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumberButton(
              context: context,
              text: '4',
              fontSize: numberFontSize,
              pressFunction: () {
                setState(() {
                  if (number.length >= 15) {
                    _showMyDialog();
                  } else {
                    List<String> results = Calculation.numberPressed(
                        resultData, number, '4', isClearr, operators);
                    number = results[0];
                    resultShowed = results[1];
                  }
                  isLastInputWasNumber = true;
                  isLastInputWasNOperator = false;
                });
              },
            ),
            NumberButton(
              context: context,
              text: '5',
              fontSize: numberFontSize,
              pressFunction: () {
                setState(() {
                  if (number.length >= 15) {
                    _showMyDialog();
                  } else {
                    List<String> results = Calculation.numberPressed(
                        resultData, number, '5', isClearr, operators);
                    number = results[0];
                    resultShowed = results[1];
                  }
                  isLastInputWasNumber = true;
                  isLastInputWasNOperator = false;
                });
              },
            ),
            NumberButton(
              context: context,
              text: '6',
              fontSize: numberFontSize,
              pressFunction: () {
                setState(() {
                  if (number.length >= 15) {
                    _showMyDialog();
                  } else {
                    List<String> results = Calculation.numberPressed(
                        resultData, number, '6', isClearr, operators);
                    number = results[0];
                    resultShowed = results[1];
                  }
                  isLastInputWasNumber = true;
                  isLastInputWasNOperator = false;
                });
              },
            ),
            NumberButton(
              context: context,
              text: '+',
              fontSize: numberFontSize,
              fontColor: primaryColor,
              pressFunction: () {
                setState(() {
                  if (number != '') {
                    if (resultShowed == '') {
                      resultShowed = number;
                      resultData = number;
                    } else {
                      resultData = resultShowed;
                    }
                    number = '';
                    isClearr = false;
                    operators = '+';
                    isLastInputWasNumber = false;
                    isLastInputWasNOperator = true;
                  }
                });
              },
            ),
            NumberButton(
              context: context,
              text: '-',
              fontSize: numberFontSize,
              fontColor: primaryColor,
              pressFunction: () {
                setState(() {
                  if (number != '') {
                    if (resultShowed == '') {
                      resultShowed = number;
                      resultData = number;
                    } else {
                      resultData = resultShowed;
                    }
                    number = '';
                    isClearr = false;
                    operators = '-';
                    isLastInputWasNumber = false;
                    isLastInputWasNOperator = true;
                  }                 
                });
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumberButton(
              context: context,
              text: '1',
              fontSize: numberFontSize,
              pressFunction: () {
                setState(() {
                  if (number.length >= 15) {
                    _showMyDialog();
                  } else {
                    List<String> results = Calculation.numberPressed(
                        resultData, number, '1', isClearr, operators);
                    number = results[0];
                    resultShowed = results[1];
                  }
                  isLastInputWasNumber = true;
                  isLastInputWasNOperator = false;
                });
              },
            ),
            NumberButton(
              context: context,
              text: '2',
              fontSize: numberFontSize,
              pressFunction: () {
                setState(() {
                  if (number.length >= 15) {
                    _showMyDialog();
                  } else {
                    List<String> results = Calculation.numberPressed(
                        resultData, number, '2', isClearr, operators);
                    number = results[0];
                    resultShowed = results[1];
                  }
                  isLastInputWasNumber = true;
                  isLastInputWasNOperator = false;
                });
              },
            ),
            NumberButton(
              context: context,
              text: '3',
              fontSize: numberFontSize,
              pressFunction: () {
                setState(() {
                  if (number.length >= 15) {
                    _showMyDialog();
                  } else {
                    List<String> results = Calculation.numberPressed(
                        resultData, number, '3', isClearr, operators);
                    number = results[0];
                    resultShowed = results[1];
                  }
                  isLastInputWasNumber = true;
                  isLastInputWasNOperator = false;
                });
              },
            ),
            NumberButton(
              context: context,
              text: 'x',
              fontSize: numberFontSize,
              fontColor: primaryColor,
              pressFunction: () {
                setState(() {
                  if (number != '') {
                    if (resultShowed == '') {
                      resultShowed = number;
                      resultData = number;
                    } else {
                      resultData = resultShowed;
                    }
                    number = '';
                    isClearr = false;
                    operators = '*';
                    isLastInputWasNumber = false;
                  isLastInputWasNOperator = true;
                  }                  
                });
              },
            ),
            NumberButton(
              context: context,
              text: '/',
              fontSize: 38,
              fontColor: primaryColor,
              pressFunction: () {
                setState(() {
                  setState(() {
                    if (number != '') {
                      if (resultShowed == '') {
                        resultShowed = number;
                        resultData = number;
                      } else {
                        resultData = resultShowed;
                      }
                      number = '';
                      isClearr = false;
                      operators = '/';
                      isLastInputWasNumber = false;
                    isLastInputWasNOperator = true;
                    }
                  });
                });
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumberButton(
              context: context,
              text: '00',
              fontSize: 45,
              pressFunction: () {
                setState(() {
                  if (number.length >= 15) {
                    _showMyDialog();
                  } else {
                    List<String> results = Calculation.numberPressed(
                        resultData, number, '00', isClearr, operators);
                    number = results[0];
                    resultShowed = results[1];
                  }
                  isLastInputWasNumber = true;
                  isLastInputWasNOperator = false;
                });
              },
            ),
            NumberButton(
              context: context,
              text: '0',
              fontSize: numberFontSize,
              pressFunction: () {
                setState(() {
                  if (number.length >= 15) {
                    _showMyDialog();
                  } else {
                    List<String> results = Calculation.numberPressed(
                        resultData, number, '0', isClearr, operators);
                    number = results[0];
                    resultShowed = results[1];
                  }
                  isLastInputWasNumber = true;
                  isLastInputWasNOperator = false;
                });
              },
            ),
            NumberButton(
              context: context,
              text: '.',
              fontSize: numberFontSize,
              pressFunction: () {
                setState(() {
                  if (number.length >= 15) {
                    _showMyDialog();
                  } else {
                    String results = Calculation.commaPressed(number);
                    number = results;
                  }
                });
              },
            ),
            NumberButton(
              context: context,
              text: '+-',
              fontSize: numberFontSize,
              fontColor: primaryColor,
              pressFunction: () {
                setState(() {
                  List<String> listResult;
                  if (number.contains('-')) {
                    listResult = Calculation.plusMinusPressed(
                        false, number, resultData, operators);
                  } else {
                    listResult = Calculation.plusMinusPressed(
                        true, number, resultData, operators);
                  }
                  resultShowed = listResult[1];
                  // resultData = resultShowed;
                  number = listResult[0];
                });
              },
            ),
            NumberButton(
                context: context,
                text: '=',
                fontSize: numberFontSize,
                fontColor: primaryColor,
                pressFunction: () {
                  setState(() {
                    number = '';
                    resultData = resultShowed;
                    isLastInputWasNumber = false;
                  isLastInputWasNOperator = false;
                  });
                }),
          ],
        ),
      ],
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child:
                Center(child: Text('Reach the maximum number of digits (15).')),
          ),
          actions: <Widget>[
            TextButton(
              child: Center(child: Text('Okay')),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
