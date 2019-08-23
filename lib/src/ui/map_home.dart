import 'package:dynamic_maps/src/app_state.dart';
import 'package:flutter/material.dart';

class MapHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final parent = AppState.of(context).parent;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          parent.checkConnectivity();
        },
        child: Icon(Icons.map),
      ),
      body: parent.onConnectivityChanged(),
    );
  }
}
