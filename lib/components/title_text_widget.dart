import 'package:flutter/material.dart';
import 'package:my_vault/common/constants.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key key,
    @required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: kPrimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}
