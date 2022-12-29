import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/widget/rounded_btn.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.white,
    ).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                      fontSize: 45.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w900),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Flash Chat'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedBtn(
              title: 'Login',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  'login_screen',
                );
              },
            ),
            RoundedBtn(
              title: 'Register',
              colour: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  'registration_screen',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


