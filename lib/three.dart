import 'package:flutter/material.dart';
class Three extends StatelessWidget {
  const Three({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("page three")),
      body: Center(child: Column(
        children: [
          Text("three"),RaisedButton(onPressed: (){
            Navigator.of(context).pop("route2");
          },child: Text("go to page two"),)
        ],
      )),
      
    );
  }
}