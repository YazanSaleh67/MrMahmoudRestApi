import 'package:course_flutter/testpackages/RestaurantModel.dart';
import 'package:course_flutter/testpackages/ResturantsProvider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:async';

class ApiTest extends StatefulWidget {
  ApiTest({Key? key}) : super(key: key);
  
  @override
  State<ApiTest> createState() => _ApiTestState();
}

class _ApiTestState extends State<ApiTest> {
  final RestaurantProivder restaurantProivder = RestaurantProivder();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: () {
            restaurantProivder.getTypeHead();
          },
          child: const Text(
            'Get Data',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body:  restaurantProivder.isLoading
          ? const Center(
              child: SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(),
              ),
            )
          : ListView.builder(
              itemCount: restaurantProivder.typeHead.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsetsDirectional.only(bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    children: [
                      Text(
                        restaurantProivder.typeHead[index].resultObject.name
                            .toString(),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
