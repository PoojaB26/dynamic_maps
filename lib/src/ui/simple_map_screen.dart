import 'package:dynamic_maps/src/connectivity_status.dart';
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

  String appTitle = "Blank";
  var connectivityResult;

  getMap() async {
    connectivityResult = await (Connectivity().checkConnectivity());
    print(connectivityResult);

    setState(() {});
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

class MapHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final parent = AppState.of(context).parent;

    return Scaffold(
        appBar: AppBar(
          title: Text(parent.appTitle),
          backgroundColor: Colors.green[700],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.map),
        ),
        body: FutureBuilder(
            future: parent.getMap(),
            builder: (context, snapshot) {
              if (snapshot.hasData) return snapshot.data;
              return CircularProgressIndicator();
            }));
  }
}
