import 'package:course_flutter/StateManagment/AddCart.dart';
import 'package:course_flutter/StateManagment/CheckoutCart.dart';
import 'package:course_flutter/StateManagment/ItemCart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomepageCart extends StatefulWidget {
  HomepageCart({Key? key}) : super(key: key);

  @override
  State<HomepageCart> createState() => _HomepageCartState();
}

class _HomepageCartState extends State<HomepageCart> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return CheckOutCart();
                      },
                    ));
                  },
                  icon: Icon(Icons.add_shopping_cart)),
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Consumer<AddCart>(
                  builder: (context, value, child) {
                    return Text("${value.count}");
                  },
                ),
              )
            ],
          )
        ],
      ),
      drawer: Drawer(),
      body: Consumer<AddCart>(builder: (context, value, child) {
        return ListView.builder(
        itemCount: value.items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(child: Consumer<AddCart>(
            builder: (context, value, child) {
              return ListTile(
                title: Text("${value.items[index].name}"),
                trailing: IconButton(
                  onPressed: () {
                      value.add(value.items[index]);
                  },
                  icon: Icon(Icons.add),
                ),
              );
            },
          ));
        },
      );
      },)
    );
  }
}
