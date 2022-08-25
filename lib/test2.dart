import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

class TestTwo extends StatefulWidget {
  TestTwo({Key? key}) : super(key: key);

  @override
  State<TestTwo> createState() => _TestTwoState();
}

class _TestTwoState extends State<TestTwo> {
  var username ;
  Future getprefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("name") ;
    });
   
    print("success");
  }
 Future deleteprefs() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("name") ;
  print("remove") ;
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "test",
          textAlign: TextAlign.center,
        ),
        titleSpacing: 125,
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("$username") ,
          RaisedButton(onPressed: ()async{
          await getprefs() ;
        },child: Text("getprefs"),) , 
        RaisedButton(onPressed: ()async{
        await deleteprefs();
        } , child: Text("deleteprefs"),)],),
      ),
    );
  }
}
