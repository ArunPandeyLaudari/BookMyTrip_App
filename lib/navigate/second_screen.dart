import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {


  final String name;
  const SecondScreen({required this.name,super.key});


 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:Text("Second Screen"),
        centerTitle: true,
       
      ),
    
      body: Center(
        child: Column(
          children: [
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Go | To | Next Page")),
              Text(name)
          ],
        ),
      ),
      
    );
  }
}