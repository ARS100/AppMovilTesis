import 'package:secure_shared_preferences/secure_shared_preferences.dart';

class RouteService {
  /// Local
  static const String protocol = "http";
  static const String domain = "192.168.1.52";
  static const String port = "3000"; //8080

  /// Ambiente agrotech
  static const String protocolag = "http";
  static const String domainag = "34.31.94.160";
  static const String portag = "8080";

  static const String routeService = "$protocol://$domain:$port";

  static const String routeServiceag = "$protocolag://$domainag:$portag";

  Future<String> getToken(String token) async {
    var pref = await SecureSharedPref.getInstance();
    return await pref.getString(token) ?? "";
  }

  Future<Map<String, String>> getHeader() async {
    return {
      "Authorization": await getToken('token'),
    };
  }
}
