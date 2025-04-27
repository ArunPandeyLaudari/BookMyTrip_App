import 'package:bookmy_trip/todo.dart';
import 'package:flutter/material.dart';

class _StatefullLifeCycleExampleState extends StatefulWidget {
  const _StatefullLifeCycleExampleState({super.key});

  @override
  State<_StatefullLifeCycleExampleState> createState() => __StatefullLifeCycleExampleStateState();
}

class __StatefullLifeCycleExampleStateState extends State<_StatefullLifeCycleExampleState> {
 
  @override
  void initState(){
    debugPrint("Init state called");
    super.initState();
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  }

  @override
  void dispose(){
    super.dispose();
  }

  Todo todo =Todo(title: "title", description: "description", inCompleted: false);

   final List<Todo> _list=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is the Todo"),
      ),

      body: ,
    )
  }
}