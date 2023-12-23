part of 'weather_bloc_bloc.dart';

sealed class WeatherBlocEvent extends Equatable {
  const WeatherBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchWeatherEvent extends WeatherBlocEvent {
  final Position position;

  const FetchWeatherEvent(this.position);

  @override
  List<Object> get props => [position];
}

class FetchWeatherbyCityNameEvent extends WeatherBlocEvent {
  final String cityName;

  const FetchWeatherbyCityNameEvent(this.cityName);
}
