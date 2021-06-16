import 'package:flutter/material.dart';
import 'package:my_vault/common/constants.dart';

class SecondaryAccountCard extends StatelessWidget {
  const SecondaryAccountCard(
      {Key key,
      @required this.cardType,
      @required this.cardNumber,
      @required this.balance})
      : super(key: key);
  final String cardType;
  final String cardNumber;
  final String balance;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: kSecondaryCardBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: <Widget>[
                    Text(
                      cardType,
                      style: TextStyle(
                        color: kTextColorBrown,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Balance',
                  style: TextStyle(
                    color: kTextColorBrown,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cardNumber,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  balance,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
