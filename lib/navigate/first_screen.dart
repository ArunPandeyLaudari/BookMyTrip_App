// import 'package:bookmy_trip/navigate/second_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
 
//  final GlobalKey<FormState> _fruitnameFromKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Array of Fruits"),
        centerTitle: true,
      
      ),
    
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(child: 
            Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),labelText: "Fruits"
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Please provide fruit name";
                    }
                    else if(value.length<3){
                      return "Provide valid fruit name";
                    }
                    else{
                      return null;
                    }
                  },
                ),

                FilledButton(onPressed: (){}, child:Text('Add Fruits'))
                
              ],
              
            )
            
            )
          ],
        ),
      ),
      
    );
  }
}