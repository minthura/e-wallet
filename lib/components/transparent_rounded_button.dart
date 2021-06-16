import 'package:flutter/material.dart';
import 'package:my_vault/common/constants.dart';

class TransparentRoundedButton extends StatelessWidget {
  const TransparentRoundedButton({
    Key key,
    @required this.title,
    @required this.press,
  }) : super(key: key);
  final String title;
  final Function press;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29),
        // gradient: LinearGradient(
        //   begin: Alignment.centerLeft,
        //   end: Alignment.centerRight,
        //   colors: [
        //     Color.fromRGBO(225, 109, 194, 1),
        //     Color.fromRGBO(237, 189, 176, 1)
        //   ],
        // ),
        color: kPrimaryColor,
      ),
      width: size.width * 0.9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: Container(
          margin: EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(29),
          ),
          child: FlatButton(
            padding: EdgeInsets.all(19),
            onPressed: press,
            child: Text(
              title,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
