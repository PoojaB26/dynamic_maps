import 'package:dynamic_maps/main.dart';
import 'package:dynamic_maps/src/ui/simple_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapHome(),
    );
  }
}
