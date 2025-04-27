import 'package:flutter/material.dart';

class NamedSecondscreen extends StatelessWidget {
  const NamedSecondscreen({super.key});

  @override
  Widget build(BuildContext context) {
    String value = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),

      body: Center(child: Text(value)),
    );
  }
}