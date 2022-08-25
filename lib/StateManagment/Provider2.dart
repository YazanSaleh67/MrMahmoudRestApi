import 'package:course_flutter/StateManagment/Provider1.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Provider2 extends StatelessWidget {
  const Provider2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Model>(context , listen: false );
    return Column(
      children: [
        Center(
          child: Text("${context.watch<Model>().name}"),
        ),
        SizedBox(
          height: 10.0,
        ),
        ElevatedButton(
            onPressed: () {
              context.read<Model>().changename();
              print(model.name);
            },
            child: Text("Do Something"))
      ],
    );
  }
}