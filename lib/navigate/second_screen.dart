import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {


  final List<String> fruitname;
  const SecondScreen({required this.fruitname,super.key});


 
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
              SizedBox(
              height: 200,
              child: ListView.builder(itemBuilder: (context, index) => 
              Text(fruitname[index]),
              itemCount: fruitname.length,
              ),
            )
          ],
        ),
      ),
      
    );
  }
}