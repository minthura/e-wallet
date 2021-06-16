import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:my_vault/common/bottom_wave_clipper.dart';
import 'package:my_vault/common/constants.dart';

class BankAccountCard extends StatelessWidget {
  const BankAccountCard({
    Key key,
    @required this.cardType,
    @required this.cardNumber,
    this.color = kPrimaryColor,
    @required this.assetName,
  }) : super(key: key);
  final String cardType;
  final String cardNumber;
  final Color color;
  final String assetName;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF4b4b4b),
                  Colors.black,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          ClipPath(
            clipper: BottomWaveClipper(),
            child: LayoutBuilder(
              builder: (context, constraints) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  // color: Colors.black26,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF2a2a2a),
                      Colors.black,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              cardType,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          // Container(
                          //   padding: EdgeInsets.all(4),
                          //   decoration: BoxDecoration(
                          //     color: Colors.white,
                          //     borderRadius: BorderRadius.circular(8),
                          //   ),
                          //   child: Image.asset(
                          //     'assets/images/$assetName.png',
                          //     width: 32,
                          //     height: 32,
                          //   ),
                          // ),
                          Text(
                            'DBS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Image.asset(
                        'assets/images/card_copper_grid.png',
                        width: 50,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      FittedBox(
                        child: Text(
                          cardNumber,
                          style: TextStyle(
                            fontFamily: 'Electrolize',
                            color: Colors.white,
                            fontSize: 100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCardOwnerInfoStack('Card Holder', 'Min Thura'),
                    buildCardOwnerInfoStack('Expiration', '11/24'),
                    buildCardOwnerInfoStack('CVV', '323'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Column buildCardOwnerInfoStack(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
