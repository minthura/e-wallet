import 'package:flutter/material.dart';
import 'package:my_vault/components/rounded_button.dart';
import 'package:my_vault/components/rounded_text_form_field.dart';
import 'package:my_vault/screens/home_screen.dart';
import 'package:progress_dialog/progress_dialog.dart';

class SignupScreen extends StatelessWidget {
  static const route = '/signup';
  @override
  Widget build(BuildContext context) {
    final ProgressDialog pr = ProgressDialog(context);
    pr.style(
      message: 'Signing up..',
    );
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 30,
                left: -40,
                child: Image.asset(
                  'assets/images/deco_6.png',
                  width: size.width * 0.5,
                ),
              ),
              Positioned(
                bottom: -20,
                left: 0,
                child: Image.asset(
                  'assets/images/deco_7.png',
                  width: size.width * 0.4,
                ),
              ),
              Positioned(
                bottom: size.height * 0.3,
                right: -80,
                child: Image.asset(
                  'assets/images/deco_8.png',
                  width: size.width * 0.4,
                ),
              ),
              Positioned(
                bottom: size.height * 0.45,
                child: Image.asset(
                  'assets/images/person_3.png',
                  width: size.width * 0.85,
                ),
              ),
              Positioned(
                bottom: size.height * 0.05,
                child: Form(
                  child: Column(
                    children: [
                      RoundedTextFormField(
                        hintText: 'Email',
                        prefixIcon: Icons.email,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      RoundedTextFormField(
                        hintText: 'Password',
                        prefixIcon: Icons.lock,
                        suffixIcon: Icons.visibility,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      RoundedTextFormField(
                        hintText: 'Retype Password',
                        prefixIcon: Icons.lock,
                        suffixIcon: Icons.visibility,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      RoundedButton(
                        title: 'Sign Up',
                        press: () {
                          pr.show();
                          Future.delayed(Duration(seconds: 3)).then((value) {
                            pr.hide().then((value) => Navigator.of(context)
                                .pushNamed(HomeScreen.route));
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
