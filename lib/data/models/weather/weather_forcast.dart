part of 'weather_models.dart';

class WeatherForecast extends Equatable {
  Location? location;
  Current? current;
  Forecast? forecast;

  WeatherForecast({this.location, this.current, this.forecast});

  WeatherForecast.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
    forecast =
        json['forecast'] != null ? Forecast.fromJson(json['forecast']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (current != null) {
      data['current'] = current!.toJson();
    }
    if (forecast != null) {
      data['forecast'] = forecast!.toJson();
    }
    return data;
  }

  @override
  List<Object?> get props => [location, current, forecast];
}
