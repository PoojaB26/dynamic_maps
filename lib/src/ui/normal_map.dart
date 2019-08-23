import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NormalMap extends StatelessWidget {
  final LatLng center;
  NormalMap({this.center});

  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
