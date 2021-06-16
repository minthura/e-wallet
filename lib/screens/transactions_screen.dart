import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_vault/common/constants.dart';
import 'package:my_vault/components/bank_cards_swiper.dart';

class TransactionsScreen extends StatefulWidget {
  static const route = '/trans';
  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  final List<Map> cards = [
    {'type': 'CREDIT CARD', 'color': kPrimaryColor, 'image': 'visa'},
    {'type': 'MASTER', 'color': Colors.brown, 'image': 'mastercard'},
    {'type': 'UNIONPAY', 'color': Colors.black, 'image': 'unionpay'},
    {'type': 'JCB', 'color': Colors.green, 'image': 'jcb'}
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        color: kPrimaryColor,
        child: SafeArea(
          child: Column(
            children: [
              bottom != 0
                  ? Container()
                  : Expanded(flex: 1, child: BankCardsSwiper(cards: cards)),
              Expanded(
                flex: 2,
                child: Card(
                  margin: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(29),
                          topRight: Radius.circular(29))),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(Icons.history),
                                    hintText: 'Transaction history'),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                padding: EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                ),
                                color: Colors.grey.shade300,
                                child: DropdownButton<String>(
                                  value: 'Filter',
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(color: kPrimaryColor),
                                  items: ['Filter']
                                      .map(
                                        (e) => DropdownMenuItem(
                                          child: Text(e),
                                          value: e,
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (_) {},
                                  underline: Container(),
                                  icon: Icon(Icons.arrow_drop_down),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (c, i) {
                            bool isCredit = Random().nextInt(2) % 2 == 0;
                            return Column(
                              children: <Widget>[
                                ListTile(
                                  leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Container(
                                          padding: EdgeInsets.all(8),
                                          color: isCredit
                                              ? Colors.green
                                              : Colors.red,
                                          child: Icon(
                                            isCredit
                                                ? Icons.arrow_forward
                                                : Icons.arrow_back,
                                            color: Colors.white,
                                          ))),
                                  title: Text(
                                    isCredit
                                        ? 'Received from internal'
                                        : 'Payroll transfer',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text('May 27th 2020 11:24:30 AM'),
                                  trailing: Text(
                                    '${isCredit ? '+\$3560.0' : '-\$1000.0'}',
                                    style: TextStyle(
                                      color:
                                          isCredit ? Colors.green : Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Divider(),
                              ],
                            );
                          },
                          itemCount: 10,
                        ),
                      )
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
