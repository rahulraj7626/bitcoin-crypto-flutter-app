import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:graph/model/list_model.dart';
import 'package:http/http.dart' as http;

Future<RigUsersSearchModel> fetchCandles() async {
  final uri = Uri.parse(
      "https://api.polygon.io/v2/aggs/grouped/locale/global/market/crypto/2020-10-14?adjusted=true&apiKey=7ZX4NxjzSd_tRcJGJ6OrLpzj5Bk0tO8g");
  var res = await http.get(uri);
  return RigUsersSearchModel.fromJson(json.decode(res.body.toString()));
}

Future<List<Candle>> fetchBitcoin() async {
  final uri = Uri.parse(
      "https://api.binance.com/api/v3/klines?symbol=BTCUSDT&interval=1h");
  final res = await http.get(uri);
  return (jsonDecode(res.body) as List<dynamic>)
      .map((e) => Candle.fromJson(e))
      .toList()
      .reversed
      .toList();
}
