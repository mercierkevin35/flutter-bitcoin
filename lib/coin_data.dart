import 'network_helper.dart';
import 'constants.dart';

class CoinData {
  static final List<String> currenciesList = [
    'AUD',
    'BRL',
    'CAD',
    'CNY',
    'EUR',
    'GBP',
    'HKD',
    'IDR',
    'ILS',
    'INR',
    'JPY',
    'MXN',
    'NOK',
    'NZD',
    'PLN',
    'RON',
    'RUB',
    'SEK',
    'SGD',
    'USD',
    'ZAR'
  ];

  static final List<String> cryptoList = [
    'BTC',
    'ETH',
    'LTC',
  ];

  final String crypto;

  CoinData(this.crypto);

  Future<dynamic> getCoinData({String quote}) async {
    String url =
        kAPIURL + '${this.crypto.toUpperCase()}/${quote.toUpperCase()}';
    NetworkHelper networkHelper = NetworkHelper(url, headers: {
      'X-CoinAPI-Key': kAPIKEY,
      'Accept': 'application/json',
      'Accept-Encoding': 'deflate, gzip',
    });
    dynamic datas = await networkHelper.getDatas();
    if (datas['rate'] != null) {
      return datas['rate'];
    }
    return null;
  }
}
