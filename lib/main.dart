import 'package:flutter/material.dart';
import 'package:setstate_demo/view/home_view.dart';

void main() {
  runApp( MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    ));
}
