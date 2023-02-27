import 'package:geolocator/geolocator.dart';

class GeolocatorLib {
  // Returns a map with the latitude, longitude and a message to show on the screen
  Future<Map<String, dynamic>> getGpsCoordinates() async {
    // Check if the getolocation service is enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return {
        "latitude": 0.0,
        "longitude": 0.0,
        "screenMessage": "Location services are disabled, please enable it"
      };
    }

    // Check geolocation permission
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      // Try to request permission
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return {
          "latitude": 0.0,
          "longitude": 0.0,
          "screenMessage": "Location permission is denied, please enable it"
        };
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return {
        "latitude": 0.0,
        "longitude": 0.0,
        "screenMessage":
            "Location permission is denied forever, please enable it"
      };
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition();

    return {
      "latitude": position.latitude,
      "longitude": position.longitude,
      "screenMessage":
          "Latitude: ${position.latitude}, Longitude: ${position.longitude}"
    };
  }
}
