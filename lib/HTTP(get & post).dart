import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Test3 extends StatefulWidget {
  Test3({Key? key}) : super(key: key);

  @override
  State<Test3> createState() => _Test3State();
}

class _Test3State extends State<Test3> {
  Future getpost() async {
    var url = "https://jsonplaceholder.typicode.com/posts?id=27&userid=3";
    //?id=val
    //&userid=val

    var response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  addPosts() async {
    var url = "https://jsonplaceholder.typicode.com/posts";
    var response = await http.post(Uri.parse(url),
        body: jsonEncode(
          {
            "title": "foo",
            "body": "bar",
            "userid": 1,
          },
          
        ));
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("dialog"),
          backgroundColor: Colors.green,
          titleSpacing: 135.0,
        ),
        drawer: Drawer(),
        body: ListView(
          children: [
            RaisedButton(
              onPressed: () {
                addPosts();
              },
              child: Text("add post"),
            ),
            FutureBuilder(
              future: getpost(),
              initialData: [],
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return Container(
                          child: Text("${snapshot.data[i]['title']}"),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 2.0),
                          ));
                    },
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ));
  }
}
