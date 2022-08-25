import 'package:firebase_storage/firebase_storage.dart';
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:course_flutter/Firebase%20Course/firebase1.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:image_picker/image_picker.dart' ;
import 'package:path/path.dart' ;

class firestorecloud extends StatefulWidget {
  firestorecloud({Key? key}) : super(key: key);

  @override
  State<firestorecloud> createState() => _firestorecloudState();
}

class _firestorecloudState extends State<firestorecloud> {
 
var file ;
 var imagepicker = ImagePicker() ;

 
 uploadimage()async{
  var ImagedPicked = await imagepicker.pickImage(source: ImageSource.camera) ;
  if (ImagedPicked != null){
    file = XFile(ImagedPicked.path) ;
    var nameImage = basename(ImagedPicked.path);
     var random = Random().nextInt(100000) ;
     nameImage = "$random$nameImage" ;
    print(nameImage) ;
    //Start upload
    var refstorage = FirebaseStorage.instance.ref("avatar").child("Part1").child("$nameImage") ;
    await refstorage.putFile(file) ;
    var url = await refstorage.getDownloadURL() ;
    print("url : $url") ;
  }else{
    print("please choose image") ;
  }
 }
  

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hautpeel"),
        titleSpacing: 110,
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(),
      body: Center(child: ElevatedButton(onPressed: ()async{
       await uploadimage();
      } , child: Text("Upload Files"),),)
    );
  }
  
 
}
