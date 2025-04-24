// import 'package:bookmy_trip/navigate/second_screen.dart';
import 'package:bookmy_trip/navigate/second_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {

   const FirstScreen({super.key});

  

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
 
 final List<String> fruitname=[];
 final GlobalKey<FormState> _addFruitFromKey = GlobalKey();

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
            Form(
              key: _addFruitFromKey,
            child: 
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

                  onSaved: (newValue) {
                    if (newValue !=null){
                      setState(() {
                        fruitname.add(newValue);
                      });
                    }
                  },
                ),

                FilledButton(onPressed: (){
                  if(!_addFruitFromKey.currentState!.validate()){
                    return;
                  }

                  _addFruitFromKey.currentState!.save();
                }, child:Text('Add Fruits')), 

                FilledButton(onPressed: (){
                  setState(() {
                    fruitname.clear();
                  });

                }, child: Text("Clear")),

                 FilledButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondScreen(fruitname: fruitname),));

                }, child: Text("Send"))
              ], 
            )
            ),

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