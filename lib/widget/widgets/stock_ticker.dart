import 'package:flutter/material.dart';

class StockTicker extends StatefulWidget {
  const StockTicker({Key? key}) : super(key: key);

  @override
  State<StockTicker> createState() => _StockTickerState();
}

class _StockTickerState extends State<StockTicker> {
  String shorthand = "AAPL";
  String cur2 = "USD";
  double val1 = 100.00;
  double val2 = -3.1;
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
      Text(shorthand),
      Text(val1.toString()),
      Text(cur2 + "%"),
    ]);
  }
}
