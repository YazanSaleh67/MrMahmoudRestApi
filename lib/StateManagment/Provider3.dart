import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Provider3 extends StatefulWidget {
  Provider3({Key? key}) : super(key: key);

  @override
  State<Provider3> createState() => _Provider3State();
}

class _Provider3State extends State<Provider3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("provider3"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) {
              return MyModel();
            },
          ),
          ChangeNotifierProvider(
            create: (context) {
              return MyModel2();
            },
          )
        ],
        child: Column(
          children: <Widget>[
            Container(child: Consumer<MyModel>(
              builder: (context, value, child) {
                return Text(MyModel.showsomething);
              },
            )),
             Container(child: Consumer<MyModel>(
              builder: (context, value, child) {
                return Text(MyModel2.showsomething);
              },
            )),
            Container(
              child: Consumer<MyModel>(
                builder: (context, value, child) {
                  return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          MyModel().dosomething();
                        });
                      },
                      child: Text("dosomething"));
                },
              ),
            ),
             Container(
              child: Consumer<MyModel>(
                builder: (context, value, child) {
                  return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          MyModel2().dosomethingmodel2();
                        });
                      },
                      child: Text("dosomething model2"));
                },
              ),
            ),
            Container(
              child: Consumer<MyModel>(
                builder: (context, value, child) {
                  return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          MyModel().dosomething2();
                        });
                      },
                      child: Text("dosomething2"));
                },
              ),
            ),
             Container(
              child: Consumer<MyModel>(
                builder: (context, value, child) {
                  return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          MyModel2().dosomething2model2();
                        });
                      },
                      child: Text("dosomething2 Model2"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyModel with ChangeNotifier {
  static var showsomething = 'Show Something';
  dosomething() {
    showsomething = "Provider Yes One";

    notifyListeners();
  }

  dosomething2() {
    showsomething = "Provider Yes Two";

    notifyListeners();
  }
}
class MyModel2 with ChangeNotifier {
  static var showsomething = 'Show Something2';
  dosomethingmodel2() {
    showsomething = "Provider Yes One model2";

    notifyListeners();
  }

  dosomething2model2() {
    showsomething = "Provider Yes Two model2";

    notifyListeners();
  }
}