import 'package:flutter/material.dart';
import 'package:graph/utils/api_constant.dart';
import 'package:graph/utils/enumerator.dart';

//Case funtion for specific currency
String checkCoin(CoinType cType) {
  switch (cType) {
    case CoinType.bitCoin:
      return ApiConstant.bitCoin;
    case CoinType.etherium:
      return ApiConstant.etherium;
    case CoinType.tether:
      return ApiConstant.tether;
    case CoinType.bnb:
      return ApiConstant.bnb;
  }
}

//Icon list
List<IconData> iconList = const [
  Icons.currency_bitcoin,
  Icons.currency_pound,
  Icons.currency_lira_sharp,
  Icons.currency_franc,
];
//Coin nameList
List<String> iconName = const ["Bitcoin", "Ethereum", "TetherUS", "BNB"];
