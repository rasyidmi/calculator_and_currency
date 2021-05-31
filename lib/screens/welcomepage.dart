import 'package:flutter/material.dart';
import 'package:calculator_and_currency/components/constants.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
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
    // print('build welcome page');
    return Opacity(
      opacity: opacityAnimation.value,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Hello there, nice to meet you!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40.0,
              foreground: Paint()..shader = gradientText,
              // color: primaryColor,
              fontFamily: 'SanFrancisco',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
