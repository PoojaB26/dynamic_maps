import 'package:dynamic_maps/src/app_state.dart';
import 'package:flutter/material.dart';

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
          onPressed: () {
            parent.onConnectivityChanged();
          },
          child: Icon(Icons.map),
        ),
        body: FutureBuilder(
            future: parent.checkConnectivity(),
            builder: (context, snapshot) {
              return parent.onConnectivityChanged();
              //return CircularProgressIndicator();
            }));
  }
}
