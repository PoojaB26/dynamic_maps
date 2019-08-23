import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapHome extends StatelessWidget {
  final LatLng center;
  final Widget onMapChanged;
  final Future<dynamic> checkConn;
  MapHome({this.center, this.onMapChanged, this.checkConn});

  @override
  Widget build(BuildContext context) {
    print('asdh');
    return Scaffold(
      appBar: AppBar(
        title: Text("Blank"),
        backgroundColor: Colors.green[700],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          checkConn;
        },
        child: Icon(Icons.map),
      ),
      body: onMapChanged,
    );
  }
}
