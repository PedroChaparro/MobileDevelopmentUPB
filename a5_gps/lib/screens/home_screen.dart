import 'package:a5_gps/lib/geolocator.dart';
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
        child: Text(_screenMessage),
      ),
    );
  }
}
