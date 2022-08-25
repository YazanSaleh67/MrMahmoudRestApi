import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class GoogleMapTest extends StatefulWidget {
  GoogleMapTest({Key? key}) : super(key: key);

  @override
  State<GoogleMapTest> createState() => _GoogleMapTestState();
}

class _GoogleMapTestState extends State<GoogleMapTest> {
  Future GetLocation() async {
    print("Start Function");
    await Future.delayed(Duration(seconds: 3), () {
      print("App Is Started ");
      print("End Function");
    });
  }

  // Start polyline
  // End polyline
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyA4ZIMg3WVMIYz2LcwSjFvm3Sq5Lm1Haak";
  Position? CL;
  var lat;
  var lang;
  CameraPosition? _kGooglePlex;

  Future GetPer() async {
    bool Services;
    LocationPermission per;
    Services = await Geolocator.isLocationServiceEnabled();
    if (Services == false) {
      AwesomeDialog(
        context: context,
        title: "Service",
        body: Text("location is not enabled"),
      )..show();
    }
    print(Services);
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
    }
    print("==================");
    print(per);
    print("==================");
    return per;
  }

  @override
  void initState() {
    ps = Geolocator.getPositionStream().listen((Position? position) {
      changemarker(position?.latitude, position?.longitude);
    });
    SetMarkerCustomImage();
    GetPer();
    getLatandLang();
    _getPolyline();
    super.initState();
  }

  Future<void> getLatandLang() async {
    CL = await Geolocator.getCurrentPosition().then((value) => value);
    lat = CL?.latitude;
    lang = CL?.longitude;
    _kGooglePlex = CameraPosition(
      target: LatLng(lat, lang),
      zoom: 14,
      bearing: 20.0,
      tilt: 20.0,
    );
    MyMarker.add(Marker(markerId: MarkerId("1"), position: LatLng(lat, lang)));
    setState(() {});
  }

  GoogleMapController? GMC;
  SetMarkerCustomImage() async {
    MyMarker.add(await Marker(
        markerId: MarkerId("1"),
        position: LatLng(27.480009, 41.708926),
        infoWindow: InfoWindow(
            title: "1",
            onTap: () {
              print("info1");
            }),
        onTap: () {
          print("1");
        },
        draggable: true,
        onDragEnd: (LatLng t) {
          print("dragend");
        },
        icon: await BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "IMAGES/1.jpg")));
  }

  //service location
  //permission
  Set<Marker> MyMarker = {};
  changemarker(newlat, newlang) {
    MyMarker.clear();
    MyMarker.add(
        Marker(markerId: MarkerId("1"), position: LatLng(newlat, newlang)));
    GMC!.animateCamera(CameraUpdate.newLatLng(LatLng(newlat, newlang)));
    setState(() {});
  }

  late StreamSubscription<Position> ps;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          titleSpacing: 120,
          leading: Icon(Icons.map),
          title: Text("hautpeel"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _kGooglePlex == null
                ? CircularProgressIndicator()
                : Center(
                    child: Container(
                      child: GoogleMap(
                        myLocationEnabled: true,
                        tiltGesturesEnabled: true,
                        compassEnabled: true,
                        scrollGesturesEnabled: true,
                        zoomGesturesEnabled: true,
                        polylines: Set<Polyline>.of(polylines.values),
                        markers: MyMarker,
                        mapType: MapType.satellite,
                        initialCameraPosition: _kGooglePlex as CameraPosition,
                        onMapCreated: (GoogleMapController controller) {
                          GMC = controller;
                        },
                      ),
                      width: 500,
                      height: 400,
                    ),
                  ),
            Center(
              child: RaisedButton(
                onPressed: () async {
                  LatLng latLng = LatLng(27.480009, 41.708926);
                  var gmc =
                      await GMC!.getLatLng(ScreenCoordinate(x: 10, y: 10));
                  print(gmc);
                },
                child: Text("Move"),
              ),
            )
          ],
        ));
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        width: 1,
        polylineId: id,
        color: Colors.red,
        points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(24.707336, 46.688496),
      PointLatLng(24.806977, 46.667539),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(24.707336, 46.688496));
        polylineCoordinates.add(LatLng(24.806977, 46.667539));
      });
    }
    _addPolyLine();
  }
}
//24.460151 latitude
//39.622329 Longitude
///////////
//27.480009 latitude
//41.708926 Longitude
//Raised button (onpressed:(){} , child(text:"show lat and long")) ,

//islocation service enabled
//location permission checkpermission
//requestpermission
//getcurrentpostion

//////AIzaSyA4ZIMg3WVMIYz2LcwSjFvm3Sq5Lm1Haak
///Sulymaniyah lANLONG((24.707336, 46.688496)) ,
///Al Yasmin lanlaong((24.806977, 46.667539))
