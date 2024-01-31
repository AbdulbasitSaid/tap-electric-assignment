part of 'weather_models.dart';

@JsonSerializable()
class WeatherForecast extends Equatable {
  final Location? location;
  final Current? current;
  final Forecast? forecast;

  const WeatherForecast({this.location, this.current, this.forecast});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastToJson(this);
  @override
  List<Object?> get props => [location, current, forecast];
}
