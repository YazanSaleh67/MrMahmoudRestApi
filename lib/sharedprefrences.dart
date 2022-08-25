import'package:flutter/material.dart' ;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SharedPrefrences extends StatefulWidget {
  SharedPrefrences({Key? key}) : super(key: key);

  @override
  State<SharedPrefrences> createState() => _SharedPrefrencesState();
  
 
  
  
 
  
  
  
 
  
}

class _SharedPrefrencesState extends State<SharedPrefrences> {
  Future saveprefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", "yazan") ;
    print("success");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('test' , textAlign: TextAlign.center,) , titleSpacing: 125,backgroundColor: Colors.green,),
      drawer: Drawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(onPressed: ()async{
            await  saveprefs() ;
            } , child: Text("save prefs"),) , 
            RaisedButton(onPressed: (){
              Navigator.of(context).pushNamed("Test2");
            } , child: Text("go to page test two"),)
          ],
        ),
      ),
    );
  }
}