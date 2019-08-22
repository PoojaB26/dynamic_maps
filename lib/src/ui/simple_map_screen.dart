import 'package:dynamic_maps/src/ui/normal_map.dart';
import 'package:dynamic_maps/src/ui/satellite_map.dart';
import 'package:dynamic_maps/src/ui/terrain_map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:connectivity/connectivity.dart';

class MapHome extends StatefulWidget {
  @override
  _MapHomeState createState() => _MapHomeState();
}

class _MapHomeState extends State<MapHome> {
  LatLng center = LatLng(45.521563, -122.677433);

  var connectivityResult;

  getMap() async {
    connectivityResult = await (Connectivity().checkConnectivity());
    print(connectivityResult);

    if (connectivityResult == ConnectivityResult.mobile) {
      return NormalMap(center);
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return SatelliteMap(center);
    } else
      return Container(
        color: Colors.grey,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[700],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {});
          },
          child: Icon(Icons.map),
        ),
        body: FutureBuilder(
            future: getMap(),
            builder: (context, snapshot) {
              if (snapshot.hasData) return snapshot.data;
              return CircularProgressIndicator();
            }));
  }
}
