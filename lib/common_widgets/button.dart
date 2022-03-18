import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonName;
  final Color color;
  final IconData icon;
  final String rate;
  final void Function()? onpressed;

  const ButtonWidget(
      {Key? key,
      required this.buttonName,
      required this.color,
      required this.icon,
      this.onpressed,
      required this.rate})
      : super(key: key);
  static const txtStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0), color: color),
          child: ListTile(
            minLeadingWidth: 0,
            leading: Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
            title: Text(
              buttonName,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            subtitle: Text(
              rate,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          )),
    );
  }
}
