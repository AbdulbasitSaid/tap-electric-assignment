part of 'weather_models.dart';

@JsonSerializable()
class Forecastday extends Equatable {
  final String? date;
  final num? dateEpoch;
  final Day? day;
  final Astro? astro;
  final List<Hour>? hour;

  const Forecastday(
      {this.date, this.dateEpoch, this.day, this.astro, this.hour});

  factory Forecastday.fromJson(Map<String, dynamic> json) =>
      _$ForecastdayFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastdayToJson(this);

  @override
  List<Object?> get props => [dateEpoch];
}
