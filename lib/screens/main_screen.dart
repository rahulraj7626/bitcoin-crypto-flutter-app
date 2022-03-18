import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:graph/model/list_model.dart';
import 'package:graph/network_services/graph_service.dart';
import 'package:graph/screens/appbarwidget.dart';
import 'package:graph/screens/button_area.dart';
import 'package:graph/utils/color_constants.dart';
import 'package:graph/utils/utils_funtions.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Candle> candles = [];

  fetch(isBit) {
    isBit == true
        ? fetchBitcoin().then((value) {
            setState(() {
              candles = value;
            });
          })
        : fetchCandles().then((value) {
            setState(() {
              List<Result> result = value.results;

              candles = candleAdd(result);
            });
          });
  }

  @override
  void initState() {
    fetch(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appbarWidget(),
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              historic(width),
              scrollList(),
              Expanded(
                child: Candlesticks(
                  candles: candles,
                ),
              ),
              buttonWidgets(context, height)
            ],
          ),
        ),
      ),
    );
  }

  Widget scrollList() {
    return SizedBox(
      height: 90,
      child: ListView.builder(
          itemCount: 2,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  index == 0 ? fetch(true) : fetch(false);
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: CColors.lightBlack,
                        radius: 30,
                        child: Icon(
                          index == 0
                              ? Icons.currency_bitcoin
                              : Icons.currency_pound,
                          size: 33,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        index == 0 ? "Bitcoin" : "Crypto",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      )
                    ]),
              ),
            );
          }),
    );
  }
}

Widget historic(width) {
  return SizedBox(
    width: width * 06,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "view historic trades",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: CColors.lightBlack.withOpacity(0.4)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Icon(
            Icons.history,
            color: CColors.lightBlack.withOpacity(0.4),
            size: 26,
          ),
        )
      ],
    ),
  );
}
