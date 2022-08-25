import 'package:course_flutter/three.dart';
import 'package:flutter/material.dart';
class Two extends StatelessWidget {
  const Two({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("page two")),
      body: Column(
        children: [
          Text("page two"),
          RaisedButton(onPressed: (){
           Navigator.of(context).pop("route1");
          },child:Text("go to page one") ,),
          RaisedButton(onPressed: (){
            Navigator.of(context).pushNamed("route3");
          },child:Text("go to page three") ,)
        ],
      ),

    );
  }
}