import 'package:flutter/material.dart';


AppBar appBarHeader({required String title}){
  return AppBar(
    automaticallyImplyLeading: false,
    title: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.black),
        )),
    elevation: 0,
    backgroundColor: Colors.transparent,
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 12.0),
        child: Icon(
          Icons.menu,
          color: Colors.white,
        ),
      )
    ],
  );
}