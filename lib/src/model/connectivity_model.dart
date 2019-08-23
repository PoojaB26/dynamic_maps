import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';

class ConnectivityModel extends ChangeNotifier {
  ConnectivityResult _connectivity;
  String _connectivityName;

  ConnectivityResult get connectivity => _connectivity;
  String get connectivityName => _connectivityName;

  void checkConnectivity() async {
    _connectivity = await (Connectivity().checkConnectivity());
    notifyListeners();

    if (_connectivity == ConnectivityResult.mobile)
      _connectivityName = "Mobile Network";
    else if (_connectivity == ConnectivityResult.wifi)
      _connectivityName = "WiFi Network";
    else
      _connectivityName = "No Network";
    notifyListeners();
  }
}