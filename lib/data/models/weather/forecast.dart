part of 'weather_models.dart';

@JsonSerializable()
class Forecast extends Equatable {
  final List<Forecastday>? forecastday;

  const Forecast({this.forecastday});
  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastToJson(this);
  @override
  List<Object?> get props => [forecastday];
}
