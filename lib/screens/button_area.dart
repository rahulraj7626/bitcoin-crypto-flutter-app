import 'package:flutter/material.dart';
import 'package:graph/common_widgets/button.dart';
import 'package:graph/utils/color_constants.dart';

Widget buttonWidgets(BuildContext context, width, price) {
  return SizedBox(
      height: 95,
      width: width,
      child: Row(
        children: [
          buttonw(CColors.red, "Buy", Icons.arrow_downward, price),
          const SizedBox(
            width: 6,
          ),
          buttonw(CColors.green, "Sell", Icons.arrow_upward, price)
        ],
      ));
}

Widget buttonw(color, txt, icon, rate) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
      child: ButtonWidget(
        rate: rate,
        icon: icon,
        buttonName: txt,
        color: color,
        onpressed: null,
      ),
    ),
  );
}
