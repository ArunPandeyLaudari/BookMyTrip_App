import 'package:bookmy_trip/homepage.dart';
import 'package:bookmy_trip/listview_builder.dart';
import 'package:bookmy_trip/named_navigate/named_firstscreen.dart';
import 'package:bookmy_trip/named_navigate/named_secondscreen.dart';
import 'package:bookmy_trip/navigate/first_screen.dart';
import 'package:flutter/material.dart';
import 'app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: NamedFirstscreen(),
      routes: {
        AppRoutes.firstScreen: (ctx) => NamedFirstscreen(),
        AppRoutes.secondScreen: (ctx) => NamedSecondscreen(),
      },  
    );
  }
}
