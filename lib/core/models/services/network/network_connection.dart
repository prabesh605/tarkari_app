import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkConnectionCheck {
  static final InternetConnectionChecker _internetConnectionChecker =
      InternetConnectionChecker();
  static Future<bool> checkConnection() async {
    bool result = await _internetConnectionChecker.hasConnection;
    return result;
  }
}
