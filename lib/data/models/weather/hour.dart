part of 'weather_models.dart';

@JsonSerializable()
class Hour {
  final num? timeEpoch;
  final String? time;
  final double? tempC;
  final double? tempF;
  final num? isDay;
  final Condition? condition;
  final double? windMph;
  final double? windKph;
  final num? windDegree;
  final String? windDir;
  final num? pressureMb;
  final double? pressureIn;
  final double? precipMm;
  final double? precipIn;
  final num? humidity;
  final num? cloud;
  final double? feelslikeC;
  final double? feelslikeF;
  final double? windchillC;
  final double? windchillF;
  final double? heatindexC;
  final double? heatindexF;
  final double? dewpointC;
  final double? dewpointF;
  final num? willItRain;
  final num? chanceOfRain;
  final num? willItSnow;
  final num? chanceOfSnow;
  final num? visKm;
  final num? visMiles;
  final double? gustMph;
  final double? gustKph;
  final num? uv;

  Hour(
      {this.timeEpoch,
      this.time,
      this.tempC,
      this.tempF,
      this.isDay,
      this.condition,
      this.windMph,
      this.windKph,
      this.windDegree,
      this.windDir,
      this.pressureMb,
      this.pressureIn,
      this.precipMm,
      this.precipIn,
      this.humidity,
      this.cloud,
      this.feelslikeC,
      this.feelslikeF,
      this.windchillC,
      this.windchillF,
      this.heatindexC,
      this.heatindexF,
      this.dewpointC,
      this.dewpointF,
      this.willItRain,
      this.chanceOfRain,
      this.willItSnow,
      this.chanceOfSnow,
      this.visKm,
      this.visMiles,
      this.gustMph,
      this.gustKph,
      this.uv});

  String? get timeToHour {
    final DateTime dateTime = DateTime.parse(time!);
    int hour = dateTime.hour;
    String amPm = hour >= 12 ? 'pm' : 'am';
    hour = hour % 12;
    hour = hour == 0 ? 12 : hour;
    return '$hour $amPm';
  }

  factory Hour.fromJson(Map<String, dynamic> json) => _$HourFromJson(json);

  Map<String, dynamic> toJson() => _$HourToJson(this);
}
