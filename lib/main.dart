import 'package:cinema_ticket_app/pages/HomePage.dart';
import 'package:cinema_ticket_app/pages/SeatPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Color(0xFF0D0846), fontSize: 15),
          bodyText2: TextStyle(color: Color(0xFF0D0846), fontSize: 12),
          headline1: TextStyle(color: Color(0xFF0D0846), fontSize: 25, fontWeight: FontWeight.bold)
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFF0D0846),
          unselectedItemColor: Color(0xFFBDBCCF)
        )
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (ctx) => HomePage(),
        SeatPage.routeName: (ctx) => SeatPage(),
      },
    );
  }
}