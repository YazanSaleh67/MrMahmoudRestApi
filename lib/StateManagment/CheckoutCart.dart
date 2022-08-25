import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ItemCart.dart';
import 'AddCart.dart';

class CheckOutCart extends StatefulWidget {
  CheckOutCart({Key? key}) : super(key: key);

  @override
  State<CheckOutCart> createState() => _CheckOutCartState();
}

class _CheckOutCartState extends State<CheckOutCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("checkout"),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        drawer: Drawer(),
        body: Consumer<AddCart>(
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.Cartitem.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: ListTile(
                  title: Text("${value.Cartitem[index].name}"),
                  trailing: IconButton(
                    onPressed: () {
                      value.remove(value.Cartitem[index]);
                    },
                    icon: Icon(Icons.remove),
                  ),
                ));
              },
            );
          },
        ));
  }
}
