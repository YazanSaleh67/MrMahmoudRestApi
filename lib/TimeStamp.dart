import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class TimeStamp extends StatefulWidget {
  TimeStamp({Key? key}) : super(key: key);

  @override
  State<TimeStamp> createState() => _TimeStampState();
}

class _TimeStampState extends State<TimeStamp> {
  @override
  void initState() {
    // TODO: implement initState
    senddatatofirebase();
    super.initState();
  }

  void senddatatofirebase() async {
    FirebaseFirestore.instance
        .collection("note")
        .add({"Timestamp": FieldValue.serverTimestamp()});
  }

  var _numbertomonthmap = {
    1: "jan",
    2: "feb",
    3: "mar",
    4: "apr",
    5: "may",
    6: "june",
    7: "july",
    8: "august",
    9: "sept",
    10: "oct",
    11: "nov",
    12: "dec"
  };
  @override
  Widget build(BuildContext context) {
   return Container();
}}
