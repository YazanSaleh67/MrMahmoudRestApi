import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_flutter/UI/HomePage(1,2,3).dart/ImageList2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailRestaurants extends StatefulWidget {
  ImageList2 restaurant;
  DetailRestaurants({Key? key, required this.restaurant}) : super(key: key);

  @override
  State<DetailRestaurants> createState() => _DetailRestaurantsState();
}

class _DetailRestaurantsState extends State<DetailRestaurants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (() {
              Navigator.of(context).pop();
            }),
          ),
          toolbarHeight: 55,
          backgroundColor: Color.fromRGBO(50, 183, 104, 30),
          centerTitle: true,
          title: Text(
            'Detail Restaurants',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(18),
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 23.0),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                      "${widget.restaurant.Name}")),
              SizedBox(
                height: 20.0,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Color.fromRGBO(50, 183, 104, 50),
                      size: 15.0,
                    ),
                    Text(
                      "${widget.restaurant.address}",
                      style: TextStyle(
                          fontSize: 10.0,
                          color: Color.fromRGBO(107, 114, 128, 107)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 170.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        topRight: Radius.circular(18.0)),
                    image: DecorationImage(
                        image: NetworkImage(
                            "${widget.restaurant.Imageurl}"),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 193.5),
                alignment: Alignment.topLeft,
                child: InkWell(
                    child: Row(
                  children: [
                    Icon(
                      Icons.directions,
                      color: Color.fromRGBO(44, 141, 255, 44),
                    ),
                    Text(
                      "Visit the restaurant",
                      style: TextStyle(
                        color: Color.fromRGBO(44, 141, 255, 44),
                      ),
                    )
                  ],
                )),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Material(
          elevation: 20.0,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 90.0, right: 90.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(child: Text('Booking'), onPressed: () {}),
            ),
          ),
        ));
  }
}
// Imageurl
// "https://firebasestorage.googleapis.com/v0/b/courseflutter-2b82f.appspot.com/o/FoodImages3%2FPhoto%2001.png?alt=media&token=4c77bad0-885d-4d0c-8d7e-06b4ba236185"
// Name
// "Chicken Biryani"
// address
// "Kazi Deiry , Taiger Pass Chittagong"

class DetailRestaurants1 {
  String? Imageurl;
  String? Name;
  String? address;
  DetailRestaurants1(this.Imageurl, this.Name, this.address);
  DetailRestaurants1.fromJson(Map<String, dynamic> json)
      : Imageurl = json['Imageurl'],
        Name = json['Name'],
        address = json['address'];
  Map<String?, dynamic> toJson() =>
      {Imageurl: this.Imageurl, Name: this.Name, address: this.address};
}

class GetDetailRestaurants1 with ChangeNotifier {
  List<DetailRestaurants1> RecievedDetailRestaurants1 = [];
  void setImage(List<DetailRestaurants1> revieveddetailrestaurant1) {
    this.RecievedDetailRestaurants1 = revieveddetailrestaurant1;
    //here
    notifyListeners();
    //there
  }

  Future<void> GetDetailedRestaurants1() async {
    List<DetailRestaurants1> FinalRecievedDetailRestaurants1 = [];
    var firebasefirestore4 =
        FirebaseFirestore.instance.collection('Detail Restaurants 1');
    QuerySnapshot<Map<String, dynamic>> response4 =
        await firebasefirestore4.get();
    response4.docs.forEach((e) => {
          FinalRecievedDetailRestaurants1.add(
              DetailRestaurants1.fromJson(e.data()))
        });
    setImage(FinalRecievedDetailRestaurants1);
  }
}
