import 'package:desafio_bloc_puro_30_03_2019/home/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Puro',
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.greenAccent,
      ),
      home: HomePage(),
    );
  }
}
