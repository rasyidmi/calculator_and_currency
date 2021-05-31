import 'package:calculator_and_currency/screens/arithmeticpage.dart';
import 'package:flutter/material.dart';
import 'package:calculator_and_currency/components/constants.dart';

class CalculatorPage extends StatefulWidget {
  CalculatorPage({Key key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation opacityAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..addListener(() {
            setState(() {});
          });
    opacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 2,
      child: Opacity(
        opacity: opacityAnimation.value,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: primaryColor,
            ),
            title: Center(
              child: Text(
                'Calculator',
                style: TextStyle(
                  // color: primaryColor,
                  foreground: Paint()..shader = gradientText,
                ),
              ),
            ),
            backgroundColor: backgroundColor,
            bottom: TabBar(
              labelColor: primaryColor,
              unselectedLabelColor: secondaryColor,
              indicatorColor: Colors.blue,
              tabs: [
                Tab(icon: Icon(Icons.calculate)),
                Tab(icon: Icon(Icons.attach_money)),
              ],
            ),
          ),
          backgroundColor: backgroundColor,
          // bottomNavigationBar: BottomBar(route: '/calculator'),

          body: TabBarView(
            children: [
              ArithmeticPage(),
              Center(child: Text('To be implemented.')),
            ],
          ),
        ),
      ),
    );
  }
}
