import 'package:dynamic_maps/src/app_state.dart';
import 'package:dynamic_maps/src/ui/map_home.dart';
import 'package:dynamic_maps/src/ui/normal_map.dart';
import 'package:dynamic_maps/src/ui/satellite_map.dart';
import 'package:dynamic_maps/src/ui/terrain_map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:connectivity/connectivity.dart';

class MapRoot extends StatefulWidget {
  @override
  MapRootState createState() => MapRootState();
}

class MapRootState extends State<MapRoot> {
  LatLng center = LatLng(45.521563, -122.677433);

  var connectivityResult;

  checkConnectivity() async {
    connectivityResult = await (Connectivity().checkConnectivity());
    setState(() {});
  }

  String appTitle = "Blank";

  onConnectivityChanged() {
    if (connectivityResult == ConnectivityResult.mobile) {
      appTitle = "Mobile Network";
      return NormalMap();
    } else if (connectivityResult == ConnectivityResult.wifi) {
      appTitle = "WiFi Network";
      return SatelliteMap();
    } else {
      appTitle = "No Network";
      return Container(
        color: Colors.grey,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppState(
      parent: this,
      child: MapHome(),
    );
  }
}
