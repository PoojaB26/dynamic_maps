import 'package:dynamic_maps/src/connectivity_status.dart';
import 'package:dynamic_maps/src/model/connectivity_model.dart';
import 'package:dynamic_maps/src/model/connectivity_stream_model.dart';
import 'package:dynamic_maps/src/ui/map_home.dart';
import 'package:dynamic_maps/src/ui/normal_map.dart';
import 'package:dynamic_maps/src/ui/satellite_map.dart';
import 'package:dynamic_maps/src/ui/terrain_map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:connectivity/connectivity.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';

class MapRoot extends StatefulWidget {
  @override
  MapRootState createState() => MapRootState();
}

class MapRootState extends State<MapRoot> {
  LatLng center = LatLng(45.521563, -122.677433);

  onMapChanged(connectivityResult) {
    if (connectivityResult == ConnectivityResult.mobile) {
      return NormalMap();
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return SatelliteMap();
    } else {
      return Container(
        color: Colors.grey,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppState(
      parent: this,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<ConnectivityModel>(
            builder: (_) => ConnectivityModel(),
          ),
          StreamProvider<ConnectivityResult>(
            builder: (_) =>
                ConnectivityStreamsModel().connectionStatusController.stream,
          ),
        ],
        child: MapHome(),
      ),
    );
  }
}
