import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(title: Text("Location"),),
      body:GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(30.033333, 31.233334),
      zoom: 10),markers: {
        Marker(markerId: MarkerId("1"),
        position: LatLng(30.033333, 31.233334),
        infoWindow: InfoWindow(
          title: "Cairo"
        ))
      },)
    );
  }
}