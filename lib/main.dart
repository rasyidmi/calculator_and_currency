import 'package:flutter/material.dart';
import 'package:calculator_and_currency/screens/mainpage.dart';

void main() {
  runApp(CalculatorAndCurrency());
}
 class CalculatorAndCurrency extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       initialRoute: '/',
       routes: {
         '/' : (context) => MainPage(),
       },
       
     );
   }
 }