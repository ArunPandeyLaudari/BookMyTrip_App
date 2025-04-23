import 'package:flutter/material.dart';

class ListviewBuilder extends StatelessWidget {
  const ListviewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

body: ListView.builder(itemBuilder:(context, index) {
  return Text(
    index.toString(),style: TextStyle(fontSize: 21,color: Colors.red),

  );  
  
},

itemCount:11,

 ),
    ));
  }
}