import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_vault/components/rounded_button.dart';
import 'package:my_vault/components/subtitle_text_widget.dart';
import 'package:my_vault/components/title_text_widget.dart';
import 'package:my_vault/components/transparent_rounded_button.dart';
import 'package:my_vault/screens/logged_screen.dart';
import 'package:my_vault/screens/login_screen.dart';
import 'package:my_vault/screens/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const route = '/';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: -20,
              child: Image.asset(
                'assets/images/deco_1.png',
                width: size.width * 0.35,
              ),
            ),
            Positioned(
              right: -30,
              bottom: size.height * 0.1,
              child: Image.asset(
                'assets/images/deco_2.png',
                width: size.width * 0.35,
              ),
            ),
            Positioned(
              top: size.height * 0.2,
              child: Image.asset(
                'assets/images/deco_3.png',
                width: size.width,
              ),
            ),
            Positioned(
              top: size.height * 0.2,
              child: Image.asset(
                'assets/images/person_1.png',
                width: size.width * 0.8,
              ),
            ),
            Positioned(
              bottom: size.height * 0.05,
              child: Column(
                children: <Widget>[
                  RoundedButton(
                    title: 'Create Account',
                    press: () {
                      Navigator.of(context).pushNamed(SignupScreen.route);
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TransparentRoundedButton(
                    title: 'Login',
                    press: () {
                      Navigator.of(context).pushNamed(LoggedScreen.route);
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              top: size.height * 0.59,
              child: Column(
                children: <Widget>[
                  TitleText(
                    title: 'Welcome',
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SubtitleText(
                    title: 'To the future of mobile banking',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
