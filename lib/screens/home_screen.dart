import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_vault/common/constants.dart';
import 'package:my_vault/components/bank_account_card.dart';
import 'package:my_vault/components/bank_cards_swiper.dart';
import 'package:my_vault/screens/transactions_screen.dart';

class HomeScreen extends StatelessWidget {
  static const route = '/home';
  @override
  Widget build(BuildContext context) {
    List<Map> cards = [
      {'type': 'VISA', 'color': kPrimaryColor, 'image': 'visa'},
      {'type': 'MASTER', 'color': Colors.brown, 'image': 'mastercard'},
      {'type': 'UNIONPAY', 'color': Colors.grey.shade900, 'image': 'unionpay'},
      {'type': 'JCB', 'color': Colors.green, 'image': 'jcb'}
    ];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: size.height,
        color: kPrimaryColor,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Column(children: [
                  Text(
                    'Welcome',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Min Thura',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Main Account Balance',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '\$ 79,675.99',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 36),
                  ),
                ]),
              ),
              Expanded(
                child: Card(
                  margin: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(29),
                          topRight: Radius.circular(29))),
                  color: Colors.white,
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: 1.5,
                              children: <Widget>[
                                buildCardExchangeRates(
                                  FontAwesomeIcons.bitcoin,
                                  'Bitcoin Rate',
                                  '10,946.20 USD',
                                ),
                                buildCardExchangeRates(
                                    FontAwesomeIcons.dollarSign,
                                    'USD Rate',
                                    '1,390 MMK'),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Card(
                            margin: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(29),
                                    topRight: Radius.circular(29))),
                            color: kPrimaryColor,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: GridView.count(
                                crossAxisCount: 3,
                                mainAxisSpacing: 2,
                                crossAxisSpacing: 2,
                                childAspectRatio: 1.1,
                                children: [
                                  buildGridCell(Icons.home, 'Home', null),
                                  buildGridCell(
                                      Icons.payment, 'My Cards', null),
                                  buildGridCell(
                                      Icons.history,
                                      'Transactions',
                                      () => Navigator.of(context)
                                          .pushNamed(TransactionsScreen.route)),
                                  buildGridCell(
                                      Icons.transform, 'Transfer', null),
                                  buildGridCell(Icons.phone, 'Topup', null),
                                  buildGridCell(Icons.settings_ethernet,
                                      'Exchange Rates', null),
                                  buildGridCell(
                                      Icons.assessment, 'Bill Payments', null),
                                  buildGridCell(
                                      Icons.settings, 'Settings', null),
                                  buildGridCell(Icons.help, 'Help', null),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Card buildCardExchangeRates(IconData icon, String title, String rate) {
    return Card(
      color: kSecondaryCardBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: FaIcon(
                icon,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              title,
              style: TextStyle(
                color: kPrimaryColor,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            FittedBox(
              child: Text(
                rate,
                maxLines: 1,
                style: TextStyle(
                    fontSize: 18,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildGridCell(IconData icon, String title, Function press) {
    return Column(
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.white,
          child: IconButton(
            padding: EdgeInsets.all(16),
            iconSize: 32,
            icon: Icon(
              icon,
              color: kPrimaryColor,
            ),
            onPressed: press,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
