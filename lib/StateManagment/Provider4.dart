import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Provider4 extends StatefulWidget {
  Provider4({Key? key}) : super(key: key);

  @override
  State<Provider4> createState() => _Provider4State();
}

class _Provider4State extends State<Provider4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider4"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(),
      body: Center(
          child: Column(
        children: <Widget>[
          Consumer<MyModel3>(
            builder: (context, value, child) {
              return Container(
                child: Text(MyModel3.name),
              );
            },
          ),
          Consumer<MyModel3>(
            builder: (context, value, child) {
              return ElevatedButton(onPressed: () {
               value.changename("hello") ;
              }, child: Text("Model"));
            },
          ) , 
          Consumer<AnotherModel>(builder:  (context, value, child) {
            return ElevatedButton(onPressed: (){
                  value.changenameelse();
            }, child: Text("AnotherModel"));
          },)
        ],
      )),
    );
  }
}

class MyModel3 with ChangeNotifier {
 static String name = "welcome";
  void changename(String val) {
   name = val;
    notifyListeners();
  }
}
class AnotherModel{
  MyModel3 Mymodel3 ;
 AnotherModel(this.Mymodel3);
 void changenameelse(){
  Mymodel3.changename("goodbye");
  
 }
}