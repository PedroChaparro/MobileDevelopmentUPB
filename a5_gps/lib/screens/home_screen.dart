import 'package:a5_gps/lib/geolocator.dart';
import 'package:a5_gps/lib/url_launcher.dart';
import 'package:a5_gps/screens/map_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _latitude = 0.0;
  double _longitude = 0.0;
  String _screenMessage = "Loading...";

  // Use the lib function to obtain the values ant update the state
  Future<void> getGpsCoordinates() async {
    Map<String, dynamic> response = await GeolocatorLib().getGpsCoordinates();

    setState(() {
      _latitude = response["latitude"];
      _longitude = response["longitude"];
      _screenMessage = response["screenMessage"];
    });
  }

// Function to launch the google maps link when the button is pressed
  Future<void> launchGoogleMaps() async {
    UrlLauncherLib.launchGoogleMaps(_latitude, _longitude);
  }

  @override
  void initState() {
    super.initState();
    getGpsCoordinates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPS app'),
      ),
      body: Center(
        child: Column(
          children: [
            // Show the "response" message
            Text(_screenMessage),
            // Show the button to launch google maps only if the latitude is not the default value
            if (_latitude != 0.0 && _longitude != 0.0)
              ElevatedButton(
                  onPressed: launchGoogleMaps,
                  child: const Text("Launch google maps")),
            // Show the button to go to the map view only if the latitude is the default value
            if (_latitude != 0.0 && _longitude != 0.0)
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MapScreen(
                              latitude: _latitude, longitude: _longitude))),
                  child: const Text("Go to the map view"))
          ],
        ),
      ),
    );
  }
}
