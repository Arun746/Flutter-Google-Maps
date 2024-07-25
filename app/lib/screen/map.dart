import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = LatLng(27.694441, 85.320364);

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_center.toString()),
        position: _center,
        infoWindow: const InfoWindow(
          title: 'Location',
        ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            'Maps Sample App',
            style: TextStyle(color: Colors.white),
          )),
          backgroundColor: Color.fromARGB(255, 22, 47, 58),
        ),
        body: GoogleMap(
          rotateGesturesEnabled: true,
          initialCameraPosition: const CameraPosition(
            target: _center,
            zoom: 14.0,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: _markers,
        ),
      ),
    );
  }
}
