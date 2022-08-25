import 'package:course_flutter/StateManagment/Provider2.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Provider1 extends StatefulWidget {
  Provider1({Key? key}) : super(key: key);

  @override
  State<Provider1> createState() => _Provider1State();
}

class _Provider1State extends State<Provider1> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Model(),
        child: Scaffold(
            appBar: AppBar(
              title: const Text("TestPage"),
              centerTitle: true,
              backgroundColor: Colors.green,
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
            ),
            drawer: const Drawer(),
            body: Provider2()));
  }
}

class Model extends ChangeNotifier {
  String? name = "welcome";
  changename() {
    name = "hello";
    notifyListeners();
  }
  
  
 
}



// 1 -create globalkey type  return FormState
// 2 -form return key return globalkey
