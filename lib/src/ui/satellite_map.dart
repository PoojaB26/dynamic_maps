import 'package:dynamic_maps/src/app_state.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SatelliteMap extends StatelessWidget {
  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        mapType: MapType.satellite,
        initialCameraPosition: CameraPosition(
          target: AppState.of(context).parent.center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
