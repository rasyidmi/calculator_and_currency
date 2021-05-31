import 'package:flutter/material.dart';
import 'package:calculator_and_currency/components/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutMePage extends StatefulWidget {
  AboutMePage({Key key}) : super(key: key);

  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage>
    with SingleTickerProviderStateMixin {
  String githubURL = 'https://github.com/rasyidmi';
  String twitterURL = 'https://twitter.com/rasyidmihsan';
  String instagramURL = 'https://www.instagram.com/rasyidmi/?hl=en';

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

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
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacityAnimation.value,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'ABOUT ME',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'SanFrancisco',
                    fontWeight: FontWeight.w700,
                    foreground: Paint()..shader = gradientText,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(1, 1.4),
                        spreadRadius: 2,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: ShaderMask(
                      shaderCallback: (bounds) {
                        return LinearGradient(
                          colors: <Color>[primaryColor, secondaryColor],
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.color,
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage('images/pp asik small.jpg'),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Rasyid Miftahul Ihsan',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'SanFrancisco',
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 15),
                  child: Text(
                    'Hello, my name is Rasyid Miftahul Ihsan! You can call me Rasyid. I love to code, play games, and futsal. I have strong interest in Software Engineering, especially in Mobile Development. Nice to meet you!',
                    style: TextStyle(
                      fontSize: 20,
                      color: primaryColor,
                      fontFamily: 'SanFrancisco',
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    'CONTACT ME!',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'SanFrancisco',
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      splashRadius: 30,
                      splashColor: secondaryColor,
                      icon: FaIcon(FontAwesomeIcons.instagram),
                      iconSize: 45,
                      onPressed: () {
                        _launchInBrowser(instagramURL);
                      },
                      color: primaryColor,
                    ),
                    IconButton(
                      splashRadius: 30,
                      splashColor: secondaryColor,
                      icon: FaIcon(FontAwesomeIcons.github),
                      iconSize: 45,
                      onPressed: () {
                        _launchInBrowser(githubURL);
                      },
                      color: primaryColor,
                    ),
                    IconButton(
                      splashRadius: 30,
                      splashColor: secondaryColor,
                      icon: FaIcon(FontAwesomeIcons.twitter),
                      iconSize: 45,
                      onPressed: () {
                        _launchInBrowser(twitterURL);
                      },
                      color: primaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
