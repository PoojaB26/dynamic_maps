import 'package:connectivity/connectivity.dart';
import 'package:dynamic_maps/src/ui/map_home.dart';
import 'package:dynamic_maps/src/ui/normal_map.dart';
import 'package:dynamic_maps/src/ui/satellite_map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapRoot extends StatefulWidget {
  @override
  MapRootState createState() => MapRootState();
}

class MapRootState extends State<MapRoot> {
  LatLng center = LatLng(45.521563, -122.677433);

  var connectivityResult;

  checkConnectivity() async {
    connectivityResult = await (Connectivity().checkConnectivity());

    setState(() {
      print(connectivityResult);
    });
  }

  Widget onMapChanged() {
    if (connectivityResult == ConnectivityResult.mobile) {
      return NormalMap(
        center: center,
      );
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return SatelliteMap(
        center: center,
      );
    } else
      return Container(
        color: Colors.grey,
      );
  }

  @override
  Widget build(BuildContext context) {
    return MapHome(
      center: center,
      onMapChanged: onMapChanged(),
      checkConn: checkConnectivity(),
    );
  }
}
