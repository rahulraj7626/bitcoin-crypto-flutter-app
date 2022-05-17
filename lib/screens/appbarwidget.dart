import 'package:flutter/material.dart';

AppBar appbarWidget(String value) {
  return AppBar(
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: const Icon(
      Icons.arrow_back_ios,
      color: Colors.black,
    ),
    title: Text(
      "\$ $value",
      style: const TextStyle(
          fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 10),
        child: CircleAvatar(
          child: Icon(Icons.person),
        ),
      )
    ],
  );
}
