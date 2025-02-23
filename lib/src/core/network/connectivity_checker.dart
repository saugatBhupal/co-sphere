import 'package:connectivity_plus/connectivity_plus.dart';

abstract class BaseCheckInternetConnectivity {
  Future<bool> isConnected();
}

class CheckInternetConnectivity implements BaseCheckInternetConnectivity {
  final Connectivity connectivity;

  CheckInternetConnectivity({required this.connectivity});

  @override
  Future<bool> isConnected() async {
    var connectionResult = await Connectivity().checkConnectivity();
    if (!connectionResult.contains(ConnectivityResult.mobile) &&
        !connectionResult.contains(ConnectivityResult.wifi)) {
      return false;
    } else {
      return true;
    }
  }
}
