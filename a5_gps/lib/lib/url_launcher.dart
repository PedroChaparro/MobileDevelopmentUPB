import 'package:url_launcher/url_launcher.dart';

class UrlLauncherLib {
  // Create a google maps url and launch it
  static Future<bool> launchGoogleMaps(double lat, double lon) async {
    print("Launching: https://www.google.com/maps/place/$lat,$lon");
    final uri = Uri.parse("https://www.google.com/maps/place/$lat,$lon");

    try {
      final sucess = await launchUrl(uri, mode: LaunchMode.externalApplication);
      return sucess;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
}
