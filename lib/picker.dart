import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class Picker {
  final List<String> currenciesList;

  Picker(this.currenciesList);

  CupertinoPicker _getIOSPicker({void Function(String) callback}) {
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        String value = this.currenciesList[selectedIndex];
        callback(value);
      },
      children: this.currenciesList.map((currency) {
        return Text(currency, style: TextStyle(color: Colors.white));
      }).toList(),
    );
  }

  DropdownButton _getAndroidPicker(
      {String selectedCurrency, void Function(String) callback}) {
    return DropdownButton<String>(
      value: selectedCurrency,
      icon: Icon(Icons.arrow_downward),
      style: TextStyle(color: Colors.white),
      items: this.currenciesList.map((currency) {
        return DropdownMenuItem(
          value: currency,
          child: Text(
            currency,
            style: TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
      onChanged: callback,
    );
  }

  Widget getPicker(
      {void Function(String) onChanged, String selectedCurrency: ""}) {
    if (Platform.isIOS) {
      return this._getIOSPicker(callback: onChanged);
    } else {
      return this._getAndroidPicker(
          selectedCurrency: selectedCurrency, callback: onChanged);
    }
  }
}
