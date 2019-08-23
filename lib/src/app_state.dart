import 'package:connectivity/connectivity.dart';
import 'package:dynamic_maps/src/ui/map_root.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppState extends InheritedWidget {
  final MapRootState parent;

  const AppState({
    this.parent,
    Key key,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static AppState of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppState) as AppState;
  }

  @override
  bool updateShouldNotify(AppState old) {
    return old.parent != parent;
  }
}
