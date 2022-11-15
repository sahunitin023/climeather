// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:clima_app/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.lat);
    print(location.long);
    await getData(location.lat, location.long);
  }

  Future<void> getData(double? lat, double? long) async {
    http.Response response = await http.get(Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', {
      'lat': '$lat',
      'lon': '$long',
      'appid': '4555d30ac810b12807360c33ad55b7e0'
    }));
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
