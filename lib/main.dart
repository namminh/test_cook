import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
// screens
import 'package:test_cook/screens/onboarding.dart';
import 'package:test_cook/screens/home_page.dart';
import 'package:test_cook/screens/dish_detail_page.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Restaurant',
        theme: ThemeData(fontFamily: 'OpenSans'),
        initialRoute: "/onboarding",
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          "/onboarding": (BuildContext context) => new Onboarding(),
          "/home_page": (BuildContext context) => new HomePage(),
          "/dish_detail_page": (BuildContext context) => new DishDetailPage(),
        });
  }
}
