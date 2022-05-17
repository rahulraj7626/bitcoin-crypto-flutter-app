import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:graph/network_services/graph_service.dart';
import 'package:graph/screens/appbarwidget.dart';
import 'package:graph/screens/button_area.dart';
import 'package:graph/utils/color_constants.dart';
import 'package:graph/utils/enumerator.dart';
import 'package:graph/utils/utils_funtions.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Candle> candles = [];

  fetch(CoinType ctype) {
    fetchBitcoin(checkCoin(ctype)).then((value) {
      setState(() {
        candles = value;
      });
    });
  }

  @override
  void initState() {
    fetch(CoinType.bitCoin);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:
          appbarWidget(candles.isNotEmpty ? candles[0].close.toString() : ""),
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
              buttonWidgets(context, height,
                  candles.isNotEmpty ? candles[0].close.toString() : "")
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
          itemCount: 4,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  switch (index) {
                    case 0:
                      fetch(CoinType.bitCoin);

                      break;
                    case 1:
                      fetch(CoinType.etherium);

                      break;
                    case 2:
                      fetch(CoinType.tether);

                      break;
                    case 3:
                      fetch(CoinType.bnb);

                      break;
                  }
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
                          iconList[index],
                          size: 33,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        iconName[index],
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
