import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';

class ConnectivityModel extends ChangeNotifier {
  ConnectivityResult _connectivity;
  String _connectivityName;

  ConnectivityResult get connectivity => _connectivity;
  String get connectivityName => _connectivityName;

  void updateName(ConnectivityResult result) async {
    if (result == ConnectivityResult.mobile)
      _connectivityName = "Mobile Network";
    else if (result == ConnectivityResult.wifi)
      _connectivityName = "WiFi Network";
    else
      _connectivityName = "No Network";
    notifyListeners();
  }
}
