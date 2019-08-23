import 'package:dynamic_maps/src/connectivity_status.dart';
import 'package:dynamic_maps/src/model/connectivity_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';

class MapHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final parent = AppState.of(context).parent;

    print('asdh');
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ConnectivityModel model, child) {
            return Text(model.connectivityName ?? "Blank");
          },
        ),
        backgroundColor: Colors.green[700],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ConnectivityModel>(context, listen: false)
              .checkConnectivity();
        },
        child: Icon(Icons.map),
      ),
      body: Consumer(
        builder: (context, ConnectivityModel model, child) {
          return parent.onMapChanged(model.connectivity);
        },
      ),
    );
  }
}
