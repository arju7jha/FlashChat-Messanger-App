import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_think/screens/login_screen.dart';
import 'package:chat_think/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_think/components/round_botton.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController backgroundController;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(seconds: 1), upperBound: 60);
    backgroundController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(backgroundController);
    controller.forward();
    backgroundController.forward();
    backgroundController.addListener(() {
      setState(() {});
    });
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: controller.value,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "Flash Chat",
                      textStyle: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.black),
                      speed: Duration(milliseconds: 150),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                colour: Colors.lightBlueAccent,
                title: 'Log in',
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                }),
            RoundedButton(
                colour: Colors.blueAccent,
                title: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                })
          ],
        ),
      ),
    );
  }
}
