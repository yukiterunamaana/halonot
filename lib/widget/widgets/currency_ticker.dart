import 'package:flutter/material.dart';

class CurrencyTicker extends StatefulWidget {
  const CurrencyTicker({Key? key}) : super(key: key);

  @override
  State<CurrencyTicker> createState() => _CurrencyTickerState();
}

class _CurrencyTickerState extends State<CurrencyTicker> {
  String cur1 = "RUB";
  String cur2 = "USD";
  double val1 = 1.0;
  double val2 = 1.0;
  //todo add API to this septic tank of a widget

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      //how do I constrain these?
      //TextField(),
      Text(cur1),
      Text("="),
      //TextField(),
      Text(cur2),
    ]);
  }
}
