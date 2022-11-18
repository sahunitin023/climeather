// ignore_for_file: library_private_types_in_public_api, prefer_typing_uninitialized_variables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:clima_app/utilities/constants.dart';
import 'package:clima_app/services/weather.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen(this.locationWeather);
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  late int temp;
  late String condition;
  late String tempIcon;
  late String city;
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    double tempareture = weatherData['main']['temp'];
    temp = tempareture.toInt();
    tempIcon = weather.getWeatherIcon(weatherData['weather'][0]['id']);
    city = weatherData['name'];
    condition = weather.getMessage(temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.place,
                    size: 35.0,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    city,
                    style: const TextStyle(
                      fontFamily: 'Spartan MB',
                      fontSize: 30.0,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      tempIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  condition,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
