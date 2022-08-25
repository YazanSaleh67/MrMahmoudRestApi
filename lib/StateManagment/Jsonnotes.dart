import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_flutter/StateManagment/note.dart';
import 'package:course_flutter/StateManagment/note.dart';
import 'package:course_flutter/StateManagment/note.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'note.dart';

class Notes with ChangeNotifier {
  List<Note> RecievedNotes = [];

  void setNotes(List<Note> recievedNotes) {
    this.RecievedNotes = recievedNotes;
    //here
    notifyListeners();
    //there
  }

  Future<void> Getdata() async {
    List<Note> finalNotesList = [];
    var firebaseNotes =
        FirebaseFirestore.instance.collection("notes").orderBy("Create At");
    QuerySnapshot<Map<String, dynamic>> response = await firebaseNotes.get();
    response.docs.forEach((e) => {finalNotesList.add(Note.fromJson(e.data()))});

    setNotes(finalNotesList);
  }
}
