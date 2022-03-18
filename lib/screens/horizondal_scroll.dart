import 'package:flutter/material.dart';
import 'package:graph/utils/color_constants.dart';

class HorizondalScroll extends StatelessWidget {
  const HorizondalScroll({
    Key? key,
  }) : super(key: key);
  static const txtStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
          itemCount: 10,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: CColors.lightBlack,
                      radius: 30,
                      child: const Icon(
                        Icons.currency_bitcoin,
                        size: 33,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Bitcoin",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ]),
            );
          }),
    );
  }
}
