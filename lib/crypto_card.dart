import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  final String base;
  final String quote;
  final dynamic value;

  CryptoCard({@required this.base, @required this.quote, @required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            value != null
                ? '1 ${this.base} = ${this.value.toStringAsFixed(2)} ${this.quote}'
                : 'Loading...',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
