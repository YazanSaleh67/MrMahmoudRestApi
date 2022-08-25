import 'dart:convert';
import 'package:flutter/cupertino.dart';

class Note {
  String? CreateAt;
  String? Imageurl;
  String? UserUid;
  String? note;
  String? title;
  Note(this.title, this.note, this.Imageurl, this.CreateAt, this.UserUid);
  Note.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        note = json["note"],
        UserUid = json["UserUid"],
        Imageurl = json["Imageurl"],
        CreateAt = json["Create At"].toString();
  Map<String?, dynamic> toJson() => {
        title: this.title,
        note: this.note,
        UserUid: this.UserUid,
        Imageurl: this.Imageurl,
        CreateAt: this.CreateAt,
      };
  
}
