import 'package:candlesticks/candlesticks.dart';
import 'package:graph/model/list_model.dart';

List<Candle> candleAdd(List<Result> resul) {
  List<Candle> cand = [];
  for (int i = 0; i < resul.length; i++) {
    cand.add(Candle(
        date: DateTime.fromMicrosecondsSinceEpoch(resul[i].resultT),
        high: resul[i].h,
        low: resul[i].l,
        open: resul[i].o,
        close: resul[i].c,
        volume: resul[i].v));
  }
  return cand;
}
