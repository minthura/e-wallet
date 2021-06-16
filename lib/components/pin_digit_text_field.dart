import 'package:flutter/material.dart';
import 'package:my_vault/common/constants.dart';

class PinDigitTextField extends StatelessWidget {
  const PinDigitTextField({
    Key key,
    @required this.isActive,
  }) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.grey.shade300,
        ),
        child: Container(
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isActive ? kPrimaryDarkColor : Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
        ));
  }
}
