





import 'package:course_flutter/StateManagment/Provider1.dart';
import 'package:course_flutter/two.dart';
import 'package:flutter/material.dart';

class ONE extends StatelessWidget {
  const ONE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("page one")),
      body: Column(children: [
        Text("page one"), 
        RaisedButton(onPressed: (){
     
     
         Navigator.of(context).pop("routehome");
      
      
          
        } , child: Text("back"),),
        RaisedButton(onPressed: (){
          Navigator.of(context).pushNamed("route2");
        },child: Text("go to page two"),)
        
      ],)
    );
  }
}