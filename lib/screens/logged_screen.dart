import 'package:flutter/material.dart';
import 'package:my_vault/common/constants.dart';
import 'package:my_vault/components/six_digits_display.dart';
import 'package:my_vault/screens/home_screen.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LoggedScreen extends StatelessWidget {
  static const route = '/logged';
  @override
  Widget build(BuildContext context) {
    final ProgressDialog pr = ProgressDialog(context);
    pr.style(
      message: 'Logging in..',
    );
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: kPrimaryColor,
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: size.height * 0.1,
              left: 18,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 42,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Min Thura',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.7,
              child: Card(
                  elevation: 7,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(29),
                          topRight: Radius.circular(29))),
                  margin: EdgeInsets.all(0),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Enter your PIN',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Expanded(
                          child: SixDigitDisplay(
                            onFilled: () {
                              pr.show();
                              Future.delayed(Duration(seconds: 3))
                                  .then((value) {
                                pr.hide().then((value) => Navigator.of(context)
                                    .pushNamed(HomeScreen.route));
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
