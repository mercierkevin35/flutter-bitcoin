import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'crypto_card.dart';
import 'picker.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = CoinData.currenciesList[0];
  Map<String, dynamic> datas = {};

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  Future<void> updateUI() async {
    setState(() {
      datas = {};
    });

    for (String crypto in CoinData.cryptoList) {
      CoinData coinData = CoinData(crypto);
      dynamic response =
          await coinData.getCoinData(quote: this.selectedCurrency);
      setState(() {
        this.datas[crypto] = response;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: CoinData.cryptoList
                  .map((curr) => CryptoCard(
                      base: curr,
                      quote: this.selectedCurrency,
                      value: this.datas[curr]))
                  .toList()),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Picker(CoinData.currenciesList).getPicker(
                selectedCurrency: this.selectedCurrency,
                onChanged: (value) {
                  this.selectedCurrency = value;
                  this.updateUI();
                }),
          ),
        ],
      ),
    );
  }
}
