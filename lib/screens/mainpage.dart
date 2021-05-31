import 'package:calculator_and_currency/screens/aboutmepage.dart';
import 'package:flutter/material.dart';
import 'package:calculator_and_currency/components/constants.dart';
import 'package:calculator_and_currency/screens/calculatorpage.dart';
import 'package:calculator_and_currency/screens/welcomepage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 1;

  final _tabs = [
    CalculatorPage(),
    WelcomePage(),
    AboutMePage(),
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 8,
            ),
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            elevation: 10,
            currentIndex: _currentIndex,
            selectedItemColor: primaryColor,
            unselectedItemColor: secondaryColor,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.calculate),
                label: 'Calculator',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'About Me',
              )
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
      body:_tabs[_currentIndex],
    );
  }
}