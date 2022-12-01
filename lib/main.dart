import 'package:flutter/material.dart';
import 'package:pic_network/Guest.dart';
import 'package:pic_network/Host.dart';
import 'package:pic_network/Scanner.dart';

import 'MainMenu.dart';
import 'Salon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        initialRoute: '/MainMenu',
        routes: {
        '/MainMenu': (context) => MainMenu(),
          '/Scanner': (context) =>  ScannerWidget(),
          '/Host' :  (context) => Host(),
          '/Guest' :  (context) => Guest(),
          '/Salon' :  (context) => Salon(),
        });
  }
}