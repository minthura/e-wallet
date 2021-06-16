import 'package:flutter/material.dart';
import 'package:my_vault/common/constants.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({
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
        fontSize: 16,
      ),
    );
  }
}
